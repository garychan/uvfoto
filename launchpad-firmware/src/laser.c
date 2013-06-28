#include "laser.h"
#include "laser_data.h"

#include <math.h>
#include <stdio.h>

#include "inc/hw_ints.h"
#include "inc/hw_gpio.h"
#include "inc/hw_memmap.h"
#include "inc/hw_ssi.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/timer.h"
#include "driverlib/uart.h"
#include "driverlib/ssi.h"
#include "driverlib/udma.h"


#include "systick.h"

uint8_t ssi_data[ANGULAR_DATA_SIZE];

uint8_t data_tmp[LASER_DATA_LENGTH];
static uint8_t udma_control_table[1024] __attribute__((aligned(1024)));

//store last NUM_AVERAGE_TIME times between start of line interrupts
#define NUM_AVERAGE_TIME 10

volatile unsigned int timer_values[NUM_AVERAGE_TIME];

static volatile uint8_t laser_enabled = 0;
static volatile uint8_t laser_intensity=255;

volatile unsigned int edge_count=0;

static void start_of_line_handler();

/*    
static void laser_launch_dma() {
    uDMAChannelDisable(UDMA_CHANNEL_SSI0TX);
    uDMAChannelTransferSet(UDMA_CHANNEL_SSI0TX, UDMA_MODE_BASIC, ssi_data,
            (void *)(SSI0_BASE + SSI_O_DR), ANGULAR_DATA_SIZE); 

    uDMAChannelEnable(UDMA_CHANNEL_SSI0TX);
}
*/
static void init_start_of_line_interrupt() {
    //start of line interrupt on PB5
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
    GPIOPinTypeGPIOInput(GPIO_PORTB_BASE, GPIO_PIN_5);
    GPIOIntRegister(GPIO_PORTB_BASE, start_of_line_handler);
    GPIOIntTypeSet(GPIO_PORTB_BASE, GPIO_PIN_5, GPIO_RISING_EDGE);
    GPIOIntEnable(GPIO_PORTB_BASE, GPIO_INT_PIN_5);
}

static void laser_init_pwm() {
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_1);
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_1, 0xff);
}

static void laser_init_ssi() {
/*    //sets up SSI to transfer data bit-by-bit (to pulse laser)
    SysCtlPeripheralEnable(SYSCTL_PERIPH_SSI0);
    SSIConfigSetExpClk(SSI0_BASE, SysCtlClockGet(), SSI_FRF_TI,
            SSI_MODE_MASTER, SPI_FREQUENCY, 8);

    SSIEnable(SSI0_BASE);
    */
    //set PA5 as TX for SSI
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_5);
    //GPIOPinConfigure(GPIO_PA5_SSI0TX);
    //SSIDMAEnable(SSI0_BASE, SSI_DMA_TX);

}

void laser_step() {
    if (systick_get_count() % SYSTICK_FREQ ==0) {
        edge_count=0;
    }
}
/*
static void laser_init_dma() {
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UDMA);
    uDMAEnable();
    uDMAControlBaseSet(udma_control_table);    
    //channel 11, SSI0TX
    uDMAChannelAssign(UDMA_CHANNEL_SSI0TX);
    uDMAChannelControlSet(UDMA_CHANNEL_SSI0TX | UDMA_PRI_SELECT, UDMA_SIZE_8 | UDMA_ARB_4 | UDMA_SRC_INC_8 | UDMA_DST_INC_NONE);
}
*/

static void laser_write_bit() {
    static volatile uint16_t data_index = 0;
    static volatile uint8_t bit_mask = 1;
    TimerIntClear(TIMER3_BASE, TIMER_TIMA_TIMEOUT);

    if (ssi_data[data_index] & bit_mask) {
        GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_5, 0xff);    
    } else {
        GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_5, 0x00);
    }
    bit_mask = bit_mask << 1;
    if (bit_mask == 0) {
        data_index++;
        if (data_index >= ANGULAR_DATA_SIZE) {
            TimerDisable(TIMER3_BASE, TIMER_A);
            data_index=0;
            bit_mask=1;
        }
    }
}

static void laser_init_timers() {
    //timer is used to filter out false rising edges in interrupt handler
	SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER3);
	TimerConfigure(TIMER3_BASE, TIMER_CFG_SPLIT_PAIR | 
            TIMER_CFG_A_PERIODIC | TIMER_CFG_B_PERIODIC);

    //prescaler 80, yields 1mhz timer clock
    TimerPrescaleSet(TIMER3_BASE, TIMER_B, 80);
    TimerPrescaleSet(TIMER3_BASE, TIMER_A, 0);
    
	TimerLoadSet(TIMER3_BASE, TIMER_B, 60000);
	TimerEnable(TIMER3_BASE, TIMER_B);

    TimerIntRegister(TIMER3_BASE, TIMER_A, laser_write_bit);
    TimerIntEnable(TIMER3_BASE, TIMER_TIMA_TIMEOUT);  
}

static void laser_setup_bit_timer(int rotation_period) {
    //calculate delay between bits according to rotation period
    float period_in_s = rotation_period / 1000000.0;
    float time_per_bit = period_in_s / (ANGULAR_DATA_SIZE*8);
    uint8_t timer_value = (uint8_t)(time_per_bit * SysCtlClockGet());

    TimerLoadSet(TIMER3_BASE, TIMER_A, timer_value);
}

void laser_init() {
    laser_init_timers();
    init_start_of_line_interrupt();
    laser_init_ssi();
    //laser_init_dma();
    laser_init_pwm();
}



void laser_set_intensity(uint8_t intensity) {
    laser_intensity = intensity;
}

void laser_enable() {
    laser_enabled = 1;
}

void laser_disable() {
    laser_enabled = 0;
}

static void start_of_line_handler() {
    static volatile unsigned int timer_value_idx=0;
    static volatile unsigned int timer_prev_value;
    static volatile uint8_t compute_average=1;

    GPIOIntClear(GPIO_PORTB_BASE, GPIO_INT_PIN_5);

    volatile int tmp = TimerValueGet(TIMER3_BASE, TIMER_B);
    if (((timer_prev_value - tmp) > 5000) || ((timer_prev_value - tmp) < 0)) {
        if (laser_enabled)
            TimerEnable(TIMER3_BASE, TIMER_A);
        edge_count++;
    }
    if (compute_average) {
        //computes average rotation period for 10 periods
        //WARNING: it's essnetial that motor is running at full speed at this
        //time

        if (timer_prev_value > tmp) {
            //don't compute incorrect values when timer overflows
            timer_values[timer_value_idx] = timer_prev_value - tmp; 
            timer_value_idx++;
        }

        timer_prev_value = tmp;

        if (timer_value_idx>=NUM_AVERAGE_TIME) {
            int rotation_period = 0;
            for (int i=0;i<NUM_AVERAGE_TIME;i++)
                rotation_period += timer_values[i];
            rotation_period = rotation_period / NUM_AVERAGE_TIME;
            laser_setup_bit_timer(rotation_period);             
            compute_average = 0;
        }
    }
}

void laser_load_calibration_data() {
    //generates an alternating pattern of 16mm long segments
    laser_generate_calibration_data(data_tmp);
    laser_load_data(data_tmp, ssi_data);
}


void laser_calibration_set_point(float position) {
    laser_calibration_point_set_position(data_tmp, position);
    laser_load_data(data_tmp, ssi_data);
}

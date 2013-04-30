EESchema Schematic File Version 2  date otrdiena, 2013. gada 30. aprīlis, plkst. 20 un 12
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:laser_peripherals-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date "30 apr 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STELLARIS_LAUNCHPAD U4
U 1 1 517FDBD9
P 4650 4450
F 0 "U4" H 4650 4350 60  0000 C CNN
F 1 "STELLARIS_LAUNCHPAD" H 4650 4500 60  0000 C CNN
F 2 "~" H 4650 4450 60  0000 C CNN
F 3 "~" H 4650 4450 60  0000 C CNN
	1    4650 4450
	1    0    0    -1  
$EndComp
Text HLabel 3750 2950 0    60   Output ~ 0
MOTOR_EN
Text HLabel 5550 3650 2    60   Output ~ 0
MOTOR_CLK
Text HLabel 3750 2550 0    60   Input ~ 0
LED_DETECTOR
Wire Wire Line
	3750 2650 2600 2650
Wire Wire Line
	2600 2650 2600 2750
$Comp
L GND #PWR012
U 1 1 517FDBED
P 2600 2750
F 0 "#PWR012" H 2600 2750 30  0001 C CNN
F 1 "GND" H 2600 2680 30  0001 C CNN
F 2 "" H 2600 2750 60  0000 C CNN
F 3 "" H 2600 2750 60  0000 C CNN
	1    2600 2750
	1    0    0    -1  
$EndComp
Text HLabel 3750 3750 0    60   Output ~ 0
LASER_PULSE_OUT
Text HLabel 3750 2750 0    60   Output ~ 0
LASER_PWM_OUT
Text HLabel 3750 2850 0    60   Output ~ 0
STEP_A1
Text HLabel 3750 3050 0    60   Output ~ 0
STEP_A2
Text HLabel 3750 3250 0    60   Output ~ 0
STEP_B1
Text HLabel 3750 3450 0    60   Output ~ 0
STEP_B2
Text HLabel 3750 3150 0    60   Input ~ 0
STEP_HOME_POS
NoConn ~ 3750 2350
NoConn ~ 3750 2450
NoConn ~ 3750 3350
NoConn ~ 3750 3550
NoConn ~ 3750 3650
NoConn ~ 3750 3850
NoConn ~ 3750 3950
NoConn ~ 3750 4050
NoConn ~ 3750 4150
NoConn ~ 3750 4250
NoConn ~ 5550 4250
NoConn ~ 5550 4150
NoConn ~ 5550 4050
NoConn ~ 5550 3950
NoConn ~ 5550 3850
NoConn ~ 5550 3750
NoConn ~ 5550 3550
NoConn ~ 5550 3450
NoConn ~ 5550 3350
NoConn ~ 5550 3250
NoConn ~ 5550 3150
NoConn ~ 5550 3050
NoConn ~ 5550 2950
NoConn ~ 5550 2850
NoConn ~ 5550 2750
NoConn ~ 5550 2650
NoConn ~ 5550 2550
NoConn ~ 5550 2450
NoConn ~ 5550 2350
$EndSCHEMATC

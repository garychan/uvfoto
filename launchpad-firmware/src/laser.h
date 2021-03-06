#ifndef __LASER__H
#define __LASER__H


#include <stdint.h>
#include <stdbool.h>
/*
 * Part of the firmware which renders line by turning laser on at the right
 * time.
 *
 * Data is represented as bit-packed array. Each bit represents 0.1mm segment
 * of line. If bit is set, laser is on for that part of the segment, if it's
 * not set, laser is off.
 *
*/

/* Implementation details: output which pulses laser is configured as SSI (SPI)
 * interface data output. Data (line) to paint is written with laser_load_data,
 * which sets up uDMA so that SSI transfers are asynchronous.
 *
 * SSI interface bitrate is matched to speed of rotating
 * mirror, and when laser detector is triggered, uDMA is given a command to
 * start shifting out data.
 */


//initializes timers and initial data structures 
//also sets up outputs and inputs
void laser_init();


//sets laser intensity- 0..255
void laser_set_intensity(uint8_t intensity);

//sets laser exposure time in ms
void laser_set_exposure_time(uint16_t exposure_time);

void laser_load_data(uint8_t * data, uint16_t length);
//enables painting of line when start of line input is triggered (on rising
//edge)
void laser_enable();

void laser_disable();

//loads calibration data- 16mm long alternating strips of on/off
void laser_load_calibration_data();

void laser_step();

void laser_set_calibration_point(int start_bit);

#define LASER_DATA_LENGTH 512

#endif

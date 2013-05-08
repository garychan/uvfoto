EESchema Schematic File Version 2  date ceturtdiena, 2013. gada  9. maijs, plkst. 01 un 37
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
LIBS:l298_breakout
LIBS:stellaris_launchpad
LIBS:laser_peripherals-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "Lasershow"
Date "8 may 2013"
Rev ""
Comp "Hackerspace"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R14
U 1 1 518010E1
P 7050 4050
F 0 "R14" V 7130 4050 40  0000 C CNN
F 1 "1K5" V 7057 4051 40  0000 C CNN
F 2 "~" V 6980 4050 30  0000 C CNN
F 3 "~" H 7050 4050 30  0000 C CNN
	1    7050 4050
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 518010F0
P 7050 5750
F 0 "R15" H 7130 5750 40  0000 C CNN
F 1 "680R" V 7057 5751 40  0000 C CNN
F 2 "~" V 6980 5750 30  0000 C CNN
F 3 "~" H 7050 5750 30  0000 C CNN
	1    7050 5750
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 518010FF
P 7050 4600
F 0 "RV1" H 7050 4500 50  0000 C CNN
F 1 "1K" H 7050 4600 50  0000 C CNN
F 2 "~" H 7050 4600 60  0000 C CNN
F 3 "~" H 7050 4600 60  0000 C CNN
	1    7050 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4300 7050 4350
Wire Wire Line
	7050 4850 7050 5500
Wire Wire Line
	7050 6000 8300 6000
$Comp
L R R17
U 1 1 51801140
P 8300 5750
F 0 "R17" H 8380 5750 40  0000 C CNN
F 1 "680R" V 8307 5751 40  0000 C CNN
F 2 "~" V 8230 5750 30  0000 C CNN
F 3 "~" H 8300 5750 30  0000 C CNN
	1    8300 5750
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 51801148
P 7550 5600
F 0 "C3" H 7550 5700 40  0000 L CNN
F 1 "C" H 7556 5515 40  0000 L CNN
F 2 "~" H 7588 5450 30  0000 C CNN
F 3 "~" H 7550 5600 60  0000 C CNN
	1    7550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5800 7550 6150
Connection ~ 7550 6000
Wire Wire Line
	7200 4600 8000 4600
Wire Wire Line
	7550 5400 7550 4600
Connection ~ 7550 4600
Text HLabel 7050 3800 0    60   Input ~ 0
LASER_PWM_IN
$Comp
L BC547 Q4
U 1 1 51801178
P 8200 4600
F 0 "Q4" H 8200 4451 40  0000 R CNN
F 1 "BC547" H 8200 4750 40  0000 R CNN
F 2 "TO92" H 8100 4702 29  0000 C CNN
F 3 "~" H 8200 4600 60  0000 C CNN
	1    8200 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4800 8300 5500
$Comp
L R R16
U 1 1 51801191
P 8300 4000
F 0 "R16" H 8380 4000 40  0000 C CNN
F 1 "100R" V 8307 4001 40  0000 C CNN
F 2 "~" V 8230 4000 30  0000 C CNN
F 3 "~" H 8300 4000 30  0000 C CNN
	1    8300 4000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 51801199
P 8300 3600
F 0 "#PWR012" H 8300 3700 30  0001 C CNN
F 1 "VCC" H 8300 3700 30  0000 C CNN
F 2 "" H 8300 3600 60  0000 C CNN
F 3 "" H 8300 3600 60  0000 C CNN
	1    8300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3600 8300 3750
Wire Wire Line
	8300 4250 8300 4400
$Comp
L +12V #PWR013
U 1 1 518011E0
P 9950 3600
F 0 "#PWR013" H 9950 3550 20  0001 C CNN
F 1 "+12V" H 9950 3700 30  0000 C CNN
F 2 "" H 9950 3600 60  0000 C CNN
F 3 "" H 9950 3600 60  0000 C CNN
	1    9950 3600
	1    0    0    -1  
$EndComp
$Comp
L BD237 Q5
U 1 1 518011EF
P 9850 5250
F 0 "Q5" H 9850 5100 40  0000 R CNN
F 1 "BD237" H 9850 5400 40  0000 R CNN
F 2 "TO126" H 9730 5350 29  0001 C CNN
F 3 "~" H 9850 5250 60  0000 C CNN
	1    9850 5250
	1    0    0    -1  
$EndComp
$Comp
L DIODE D6
U 1 1 5180120D
P 10350 4300
F 0 "D6" H 10350 4400 40  0000 C CNN
F 1 "DIODE" H 10350 4200 40  0000 C CNN
F 2 "~" H 10350 4300 60  0000 C CNN
F 3 "~" H 10350 4300 60  0000 C CNN
	1    10350 4300
	0    1    1    0   
$EndComp
$Comp
L DIODE D4
U 1 1 5180121C
P 10150 4100
F 0 "D4" H 10150 4200 40  0000 C CNN
F 1 "DIODE" H 10150 4000 40  0000 C CNN
F 2 "~" H 10150 4100 60  0000 C CNN
F 3 "~" H 10150 4100 60  0000 C CNN
	1    10150 4100
	1    0    0    -1  
$EndComp
$Comp
L DIODE D5
U 1 1 51801235
P 10150 4500
F 0 "D5" H 10150 4600 40  0000 C CNN
F 1 "DIODE" H 10150 4400 40  0000 C CNN
F 2 "~" H 10150 4500 60  0000 C CNN
F 3 "~" H 10150 4500 60  0000 C CNN
	1    10150 4500
	-1   0    0    1   
$EndComp
$Comp
L DIODE D3
U 1 1 51801242
P 9950 4700
F 0 "D3" H 9950 4800 40  0000 C CNN
F 1 "DIODE" H 9950 4600 40  0000 C CNN
F 2 "~" H 9950 4700 60  0000 C CNN
F 3 "~" H 9950 4700 60  0000 C CNN
	1    9950 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 4900 9950 5050
$Comp
L LED D2
U 1 1 5180125D
P 9950 3850
F 0 "D2" H 9950 3950 50  0000 C CNN
F 1 "LED" H 9950 3750 50  0000 C CNN
F 2 "~" H 9950 3850 60  0000 C CNN
F 3 "~" H 9950 3850 60  0000 C CNN
	1    9950 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 3600 9950 3650
Wire Wire Line
	9950 4050 9950 4100
$Comp
L R R20
U 1 1 51801287
P 9950 5950
F 0 "R20" V 10030 5950 40  0000 C CNN
F 1 "2R7" V 9957 5951 40  0000 C CNN
F 2 "~" V 9880 5950 30  0000 C CNN
F 3 "~" H 9950 5950 30  0000 C CNN
	1    9950 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 5450 9950 5700
Wire Wire Line
	9650 5250 8300 5250
Connection ~ 8300 5250
$Comp
L MOSFET_N Q6
U 1 1 518012BA
P 9850 6500
F 0 "Q6" H 9860 6670 60  0000 R CNN
F 1 "MOSFET_N" H 9860 6350 60  0000 R CNN
F 2 "~" H 9850 6500 60  0000 C CNN
F 3 "~" H 9850 6500 60  0000 C CNN
	1    9850 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 518012C9
P 9950 6950
F 0 "#PWR014" H 9950 6950 30  0001 C CNN
F 1 "GND" H 9950 6880 30  0001 C CNN
F 2 "" H 9950 6950 60  0000 C CNN
F 3 "" H 9950 6950 60  0000 C CNN
	1    9950 6950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 518012D8
P 7550 6150
F 0 "#PWR015" H 7550 6150 30  0001 C CNN
F 1 "GND" H 7550 6080 30  0001 C CNN
F 2 "" H 7550 6150 60  0000 C CNN
F 3 "" H 7550 6150 60  0000 C CNN
	1    7550 6150
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 518012E5
P 9500 6850
F 0 "R19" H 9580 6850 40  0000 C CNN
F 1 "10K" V 9507 6851 40  0000 C CNN
F 2 "~" V 9430 6850 30  0000 C CNN
F 3 "~" H 9500 6850 30  0000 C CNN
	1    9500 6850
	0    -1   -1   0   
$EndComp
$Comp
L R R18
U 1 1 518012EB
P 8600 6500
F 0 "R18" H 8680 6500 40  0000 C CNN
F 1 "56R" V 8607 6501 40  0000 C CNN
F 2 "~" V 8530 6500 30  0000 C CNN
F 3 "~" H 8600 6500 30  0000 C CNN
	1    8600 6500
	0    -1   -1   0   
$EndComp
Text HLabel 2100 6850 0    60   Input ~ 0
LASER_PULSE_IN
Wire Wire Line
	8850 6500 9650 6500
Wire Wire Line
	9250 6850 9250 6500
Connection ~ 9250 6500
Wire Wire Line
	9750 6850 9950 6850
Wire Wire Line
	9950 6700 9950 6950
Connection ~ 9950 6850
Wire Wire Line
	9950 6200 9950 6300
Text Notes 10250 5300 0    60   ~ 0
BD239\n
Text Notes 10200 6550 0    60   ~ 0
IRF530\n
Text Notes 10550 4300 0    60   ~ 0
1N4004
$Comp
L BC547 Q3
U 1 1 51802841
P 3050 6850
F 0 "Q3" H 3050 6701 40  0000 R CNN
F 1 "BC547" H 3050 7000 40  0000 R CNN
F 2 "TO92" H 2950 6952 29  0000 C CNN
F 3 "~" H 3050 6850 60  0000 C CNN
	1    3050 6850
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 51802847
P 2500 6850
F 0 "R11" V 2580 6850 40  0000 C CNN
F 1 "900R" V 2507 6851 40  0000 C CNN
F 2 "~" V 2430 6850 30  0000 C CNN
F 3 "~" H 2500 6850 30  0000 C CNN
	1    2500 6850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR016
U 1 1 5180284D
P 3150 7150
F 0 "#PWR016" H 3150 7150 30  0001 C CNN
F 1 "GND" H 3150 7080 30  0001 C CNN
F 2 "" H 3150 7150 60  0000 C CNN
F 3 "" H 3150 7150 60  0000 C CNN
	1    3150 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 7050 3150 7150
Wire Wire Line
	2750 6850 2850 6850
Wire Wire Line
	2250 6850 2100 6850
$Comp
L VCC #PWR017
U 1 1 51802856
P 3150 5850
F 0 "#PWR017" H 3150 5950 30  0001 C CNN
F 1 "VCC" H 3150 5950 30  0000 C CNN
F 2 "" H 3150 5850 60  0000 C CNN
F 3 "" H 3150 5850 60  0000 C CNN
	1    3150 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6450 3150 6650
$Comp
L R R13
U 1 1 5180285D
P 3150 6200
F 0 "R13" V 3230 6200 40  0000 C CNN
F 1 "900R" V 3157 6201 40  0000 C CNN
F 2 "~" V 3080 6200 30  0000 C CNN
F 3 "~" H 3150 6200 30  0000 C CNN
	1    3150 6200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 5850 3150 5950
Wire Wire Line
	3150 5900 2800 5900
Wire Wire Line
	2800 5900 2800 6000
Connection ~ 3150 5900
$Comp
L R R12
U 1 1 51802867
P 2800 6250
F 0 "R12" V 2880 6250 40  0000 C CNN
F 1 "900R" V 2807 6251 40  0000 C CNN
F 2 "~" V 2730 6250 30  0000 C CNN
F 3 "~" H 2800 6250 30  0000 C CNN
	1    2800 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 6500 2800 6850
Connection ~ 2800 6850
Wire Wire Line
	3150 6550 8350 6550
Connection ~ 3150 6550
Connection ~ 2250 6850
Connection ~ 3150 5850
Connection ~ 2750 6850
Wire Wire Line
	8350 6550 8350 6500
Connection ~ 5450 1550
Connection ~ 4550 1450
Connection ~ 4050 1450
Connection ~ 2700 2200
Connection ~ 2700 1400
Connection ~ 2300 1700
Connection ~ 2300 1900
Connection ~ 5000 1250
Connection ~ 5300 950 
Connection ~ 4700 1450
Wire Wire Line
	4700 950  4700 1450
Wire Wire Line
	4800 950  4700 950 
Wire Wire Line
	5600 950  5300 950 
Wire Wire Line
	5600 1550 5600 950 
Wire Wire Line
	5450 1550 5700 1550
Wire Wire Line
	4750 2400 4750 1650
Connection ~ 4200 2400
Wire Wire Line
	4200 2400 4750 2400
Wire Wire Line
	4200 2350 4200 2450
Wire Wire Line
	4550 1450 4750 1450
Wire Wire Line
	4050 1800 4050 1450
Wire Wire Line
	3300 1800 4050 1800
Wire Wire Line
	2700 1300 2700 1400
Wire Wire Line
	2700 2200 2700 2300
Connection ~ 2200 1600
Wire Wire Line
	2200 2200 2700 2200
Wire Wire Line
	2200 1600 2200 2200
Wire Wire Line
	2300 2000 2300 1900
Wire Wire Line
	1350 2000 2300 2000
Wire Wire Line
	1350 1600 2300 1600
Wire Wire Line
	2300 1600 2300 1700
$Comp
L R R4
U 1 1 51804926
P 5050 950
F 0 "R4" V 5130 950 40  0000 C CNN
F 1 "10K" V 5057 951 40  0000 C CNN
F 2 "~" V 4980 950 30  0000 C CNN
F 3 "~" H 5050 950 30  0000 C CNN
	1    5050 950 
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR018
U 1 1 5180492C
P 5000 1850
F 0 "#PWR018" H 5000 1850 30  0001 C CNN
F 1 "GND" H 5000 1780 30  0001 C CNN
F 2 "" H 5000 1850 60  0000 C CNN
F 3 "" H 5000 1850 60  0000 C CNN
	1    5000 1850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR019
U 1 1 51804932
P 5000 1250
F 0 "#PWR019" H 5000 1350 30  0001 C CNN
F 1 "VCC" H 5000 1350 30  0000 C CNN
F 2 "" H 5000 1250 60  0000 C CNN
F 3 "" H 5000 1250 60  0000 C CNN
	1    5000 1250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR020
U 1 1 51804938
P 4200 1850
F 0 "#PWR020" H 4200 1950 30  0001 C CNN
F 1 "VCC" H 4200 1950 30  0000 C CNN
F 2 "" H 4200 1850 60  0000 C CNN
F 3 "" H 4200 1850 60  0000 C CNN
	1    4200 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 5180493E
P 4200 2950
F 0 "#PWR021" H 4200 2950 30  0001 C CNN
F 1 "GND" H 4200 2880 30  0001 C CNN
F 2 "" H 4200 2950 60  0000 C CNN
F 3 "" H 4200 2950 60  0000 C CNN
	1    4200 2950
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 51804944
P 4200 2700
F 0 "R2" V 4280 2700 40  0000 C CNN
F 1 "5K" V 4207 2701 40  0000 C CNN
F 2 "~" V 4130 2700 30  0000 C CNN
F 3 "~" H 4200 2700 30  0000 C CNN
	1    4200 2700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5180494A
P 4200 2100
F 0 "R1" V 4280 2100 40  0000 C CNN
F 1 "10K" V 4207 2101 40  0000 C CNN
F 2 "~" V 4130 2100 30  0000 C CNN
F 3 "~" H 4200 2100 30  0000 C CNN
	1    4200 2100
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 51804950
P 4300 1450
F 0 "R3" V 4380 1450 40  0000 C CNN
F 1 "2K" V 4307 1451 40  0000 C CNN
F 2 "~" V 4230 1450 30  0000 C CNN
F 3 "~" H 4300 1450 30  0000 C CNN
	1    4300 1450
	0    1    1    0   
$EndComp
$Comp
L LM339 U5
U 1 1 51804956
P 5100 1550
F 0 "U5" H 5150 1750 60  0000 C CNN
F 1 "LM339" H 5200 1350 50  0000 C CNN
F 2 "" H 5100 1550 60  0000 C CNN
F 3 "" H 5100 1550 60  0000 C CNN
	1    5100 1550
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR022
U 1 1 5180495C
P 2700 1300
F 0 "#PWR022" H 2700 1400 30  0001 C CNN
F 1 "VCC" H 2700 1400 30  0000 C CNN
F 2 "" H 2700 1300 60  0000 C CNN
F 3 "" H 2700 1300 60  0000 C CNN
	1    2700 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 51804962
P 2700 2300
F 0 "#PWR023" H 2700 2300 30  0001 C CNN
F 1 "GND" H 2700 2230 30  0001 C CNN
F 2 "" H 2700 2300 60  0000 C CNN
F 3 "" H 2700 2300 60  0000 C CNN
	1    2700 2300
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 51804968
P 1350 1800
F 0 "D1" H 1350 1900 50  0000 C CNN
F 1 "LED" H 1350 1700 50  0000 C CNN
F 2 "~" H 1350 1800 60  0000 C CNN
F 3 "~" H 1350 1800 60  0000 C CNN
	1    1350 1800
	0    1    1    0   
$EndComp
$Comp
L LM358 U2
U 1 1 5180496E
P 2800 1800
F 0 "U2" H 2750 2000 60  0000 L CNN
F 1 "LM358" H 2750 1550 60  0000 L CNN
F 2 "" H 2800 1800 60  0000 C CNN
F 3 "" H 2800 1800 60  0000 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
Text HLabel 5700 1550 2    60   Output ~ 0
LASER_DETECTOR_OUT
Connection ~ 5600 1550
Text Notes 9950 3150 2    60   ~ 0
Constant current source for laser diode\n
Text Notes 3650 2550 2    60   ~ 0
Start of line detector- reverse biased blue LED,\n amplified and fed to schmitt trigger\n
$EndSCHEMATC

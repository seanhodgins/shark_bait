EESchema Schematic File Version 4
LIBS:rotary_pcb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "sam. 04 avril 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x13 J4
U 1 1 5CE42779
P 5350 2800
F 0 "J4" H 5429 2842 50  0000 L CNN
F 1 "12H" H 5429 2751 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B13B-PH-K_1x13_P2.00mm_Vertical" H 5350 2800 50  0001 C CNN
F 3 "~" H 5350 2800 50  0001 C CNN
	1    5350 2800
	1    0    0    -1  
$EndComp
$Comp
L AP2112k:GND #PWR0105
U 1 1 5CE47DA6
P 5000 3450
F 0 "#PWR0105" H 5000 3200 50  0001 C CNN
F 1 "GND" H 5000 3300 50  0000 C CNN
F 2 "" H 5000 3450 50  0000 C CNN
F 3 "" H 5000 3450 50  0000 C CNN
	1    5000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3450 5000 3400
Wire Wire Line
	5000 3400 5150 3400
$Comp
L AP2112k:GND #PWR0109
U 1 1 5CE56834
P 2550 3100
F 0 "#PWR0109" H 2550 2850 50  0001 C CNN
F 1 "GND" H 2550 2950 50  0000 C CNN
F 2 "" H 2550 3100 50  0000 C CNN
F 3 "" H 2550 3100 50  0000 C CNN
	1    2550 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 5CE6898C
P 2850 2450
F 0 "J3" H 2950 2550 50  0000 C CNN
F 1 "15MIN" H 3000 2650 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B5B-PH-K_1x05_P2.00mm_Vertical" H 2850 2450 50  0001 C CNN
F 3 "~" H 2850 2450 50  0001 C CNN
	1    2850 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x11 J6
U 1 1 5CE6B37B
P 8100 2750
F 0 "J6" H 8180 2792 50  0000 L CNN
F 1 "FLOW" H 8180 2701 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B11B-PH-K_1x11_P2.00mm_Vertical" H 8100 2750 50  0001 C CNN
F 3 "~" H 8100 2750 50  0001 C CNN
	1    8100 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3250 7800 3250
Wire Wire Line
	7800 3250 7800 3300
$Comp
L AP2112k:GND #PWR0119
U 1 1 5CE82D7C
P 7800 3300
F 0 "#PWR0119" H 7800 3050 50  0001 C CNN
F 1 "GND" H 7800 3150 50  0000 C CNN
F 2 "" H 7800 3300 50  0000 C CNN
F 3 "" H 7800 3300 50  0000 C CNN
	1    7800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2650 2650 2650
Wire Wire Line
	2550 2650 2550 3100
$Comp
L Switch:SW_Rotary12 SW2
U 1 1 5CE42BE7
P 4150 2750
F 0 "SW2" H 4050 3619 50  0000 C CNN
F 1 "SW_Rotary12" H 4050 3528 50  0000 C CNN
F 2 "project_footprints:Rotary12_CK_MC00L1NCQF" H 3950 3450 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/C200/DS-Serie%23LOR.pdf" H 3950 3450 50  0001 C CNN
F 4 "CKN11089-ND" H 4050 3437 50  0000 C CNN "Digikey Part No."
	1    4150 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2150 5150 2150
Wire Wire Line
	5150 2150 5150 2200
Wire Wire Line
	4550 2250 5150 2250
Wire Wire Line
	5150 2250 5150 2300
Wire Wire Line
	4550 2350 5150 2350
Wire Wire Line
	5150 2350 5150 2400
Wire Wire Line
	4550 2450 5150 2450
Wire Wire Line
	5150 2450 5150 2500
Wire Wire Line
	4550 2550 5150 2550
Wire Wire Line
	5150 2550 5150 2600
Wire Wire Line
	4550 2650 5150 2650
Wire Wire Line
	5150 2650 5150 2700
Wire Wire Line
	4550 2850 5150 2850
Wire Wire Line
	5150 2850 5150 2800
Wire Wire Line
	4550 2950 5150 2950
Wire Wire Line
	5150 2950 5150 2900
Wire Wire Line
	4550 3050 5150 3050
Wire Wire Line
	5150 3050 5150 3000
Wire Wire Line
	4550 3150 5150 3150
Wire Wire Line
	5150 3150 5150 3100
Wire Wire Line
	4550 3250 5150 3250
Wire Wire Line
	5150 3250 5150 3200
Wire Wire Line
	4550 3350 5150 3350
Wire Wire Line
	5150 3350 5150 3300
Wire Wire Line
	3550 2750 3450 2750
Wire Wire Line
	3450 2750 3450 2850
$Comp
L AP2112k:GND #PWR0101
U 1 1 5CE44321
P 3450 2850
F 0 "#PWR0101" H 3450 2600 50  0001 C CNN
F 1 "GND" H 3450 2700 50  0000 C CNN
F 2 "" H 3450 2850 50  0000 C CNN
F 3 "" H 3450 2850 50  0000 C CNN
	1    3450 2850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Rotary4 SW1
U 1 1 5CE47A8B
P 2000 2850
F 0 "SW1" H 1900 3719 50  0000 C CNN
F 1 "SW_Rotary4" H 1900 3628 50  0000 C CNN
F 2 "project_footprints:Rotary10_CK_MA00L1NCGF" H 1800 3550 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/C200/DS-Serie%23LOR.pdf" H 1800 3550 50  0001 C CNN
F 4 "MA05L1NCGF" H 1900 3537 50  0000 C CNN "Digikey Part No."
	1    2000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2250 2650 2250
Wire Wire Line
	2400 2350 2650 2350
Wire Wire Line
	2400 2450 2650 2450
Wire Wire Line
	2400 2550 2650 2550
Wire Wire Line
	1400 2850 1300 2850
Wire Wire Line
	1300 2850 1300 2900
$Comp
L AP2112k:GND #PWR0102
U 1 1 5CE4A31B
P 1300 2900
F 0 "#PWR0102" H 1300 2650 50  0001 C CNN
F 1 "GND" H 1300 2750 50  0000 C CNN
F 2 "" H 1300 2900 50  0000 C CNN
F 3 "" H 1300 2900 50  0000 C CNN
	1    1300 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Rotary10 SW3
U 1 1 5CE4AB87
P 7000 2800
F 0 "SW3" H 6900 3669 50  0000 C CNN
F 1 "SW_Rotary10" H 6900 3578 50  0000 C CNN
F 2 "project_footprints:Rotary10_CK_MA00L1NCGF" H 6800 3500 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/C200/DS-Serie%23LOR.pdf" H 6800 3500 50  0001 C CNN
F 4 "CKN11881-ND" H 6900 3487 50  0000 C CNN "Digikey Part No."
	1    7000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2200 7900 2200
Wire Wire Line
	7900 2200 7900 2250
Wire Wire Line
	7400 2300 7900 2300
Wire Wire Line
	7900 2300 7900 2350
Wire Wire Line
	7400 2400 7900 2400
Wire Wire Line
	7900 2400 7900 2450
Wire Wire Line
	7400 2500 7900 2500
Wire Wire Line
	7900 2500 7900 2550
Wire Wire Line
	7400 2600 7900 2600
Wire Wire Line
	7900 2600 7900 2650
Wire Wire Line
	7400 2700 7900 2700
Wire Wire Line
	7900 2700 7900 2750
Wire Wire Line
	7400 2900 7900 2900
Wire Wire Line
	7900 2900 7900 2850
Wire Wire Line
	7400 3000 7900 3000
Wire Wire Line
	7900 3000 7900 2950
Wire Wire Line
	7400 3100 7900 3100
Wire Wire Line
	7900 3100 7900 3050
Wire Wire Line
	7400 3200 7900 3200
Wire Wire Line
	7900 3200 7900 3150
Wire Wire Line
	6400 2800 6300 2800
Wire Wire Line
	6300 2800 6300 2900
$Comp
L AP2112k:GND #PWR0103
U 1 1 5CE51F1B
P 6300 2900
F 0 "#PWR0103" H 6300 2650 50  0001 C CNN
F 1 "GND" H 6300 2750 50  0000 C CNN
F 2 "" H 6300 2900 50  0000 C CNN
F 3 "" H 6300 2900 50  0000 C CNN
	1    6300 2900
	1    0    0    -1  
$EndComp
$EndSCHEMATC

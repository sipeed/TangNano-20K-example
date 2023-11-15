//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: V1.9.9 Beta-5
//Created Time: 2023-11-05 12:01:42
create_clock -name clk -period 20 -waveform {0 10} [get_ports {clk}]

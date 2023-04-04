//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.10
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Wed Feb 08 16:48:04 2023

module Gowin_CLKDIV (clkout, hclkin, resetn);

output clkout;
input hclkin;
input resetn;

wire gw_gnd;

assign gw_gnd = 1'b0;

CLKDIV clkdiv_inst (
    .CLKOUT(clkout),
    .HCLKIN(hclkin),
    .RESETN(resetn),
    .CALIB(gw_gnd)
);

defparam clkdiv_inst.DIV_MODE = "4";
defparam clkdiv_inst.GSREN = "false";

endmodule //Gowin_CLKDIV

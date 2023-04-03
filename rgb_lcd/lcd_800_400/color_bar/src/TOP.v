module TOP (
    input           Reset_Button,
    input           XTAL_IN,
    output          LCD_CLK,
    output			LCD_HYNC,
    output			LCD_SYNC,
    output			LCD_DEN,
    output	[4:0]	LCD_R,
    output	[5:0]	LCD_G,
    output	[4:0]	LCD_B
);

Gowin_rPLL chip_pll
(
.clkout(CLK_PIX), //output clkout
.clkin(XTAL_IN)   //input clkin
);


VGAMod	VGAMod_inst
(
.nRST		(	Reset_Button),

.PixelClk	(	CLK_PIX		),
.LCD_DE		(	LCD_DEN	 	),
.LCD_HSYNC	(	LCD_HYNC 	),
.LCD_VSYNC	(	LCD_SYNC 	),

.LCD_B		(	LCD_B		),
.LCD_G		(	LCD_G		),
.LCD_R		(	LCD_R		)
);

assign		LCD_CLK		 = 	CLK_PIX;

endmodule

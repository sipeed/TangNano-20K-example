module top#(
    parameter led_number = 6
)
(
    input        clk,
    output [ led_number-1 :0] leds
);

reg count_1s_flag;
reg [23:0] count_1s = 'd0;

always @(posedge clk ) begin
    if( count_1s < 27000000/2 ) begin
        count_1s <= count_1s + 'd1;
        count_1s_flag <= 'd0;
    end
    else begin
        count_1s <= 'd0;
        count_1s_flag <= 'd1;
    end
end


reg [5:0] leds_value = 'd1;

always @(posedge clk ) begin
    if( count_1s_flag ) begin
    leds_value[ led_number-1 :0] <= {leds_value[ led_number-2 :0] , leds_value[ led_number-1 ] };
    end
end

assign leds = ~leds_value;

endmodule
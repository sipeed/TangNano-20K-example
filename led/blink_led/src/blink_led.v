module top(
    input       clk,
    output      led
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

reg led_value = 'd1;

always @(posedge clk ) begin
    if( count_1s_flag ) begin
    led_value <= ~led_value;
    end
end

assign led = led_value;

endmodule
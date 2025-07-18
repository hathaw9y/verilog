module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] count0, count1, count2;
    bcdcount counter0 (clk, reset, c_enable[0], count0);
    bcdcount counter1 (clk, reset, c_enable[1], count1);
    bcdcount counter2 (clk, reset, c_enable[2], count2);
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (~reset & count0 == 4'b1001) ? 1'b1 : 1'b0;
    assign c_enable[2] = (~reset & count1 == 4'b1001 & count0 == 4'b1001) ? 1'b1 : 1'b0;
    assign OneHertz = (count2 == 4'b1001 & count1 == 4'b1001 & count0 == 4'b1001) ? 1'b1 : 1'b0;


endmodule

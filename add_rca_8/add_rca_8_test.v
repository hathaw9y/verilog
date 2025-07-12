`timescale 1ns/1ps

module add_rca_8_tb;
    reg [7:0] a, b;
    reg c_in;
    wire [7:0] sum;
    wire c_out;

    // DUT (Device Under Test)
    add_rca_8 dut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .sum(sum)
    );

    initial begin
        $display("Time |    A    +    B    + Cin =    SUM   Cout");
        $display("------------------------------------------------");

        a = 8'b00001111; b = 8'b00000001; c_in = 0; #10;
        $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, c_in, sum, c_out);

        a = 8'b00001111; b = 8'b00000001; c_in = 1; #10;
        $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, c_in, sum, c_out);

        a = 8'b11111111; b = 8'b00000001; c_in = 0; #10;
        $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, c_in, sum, c_out);

        a = 8'b10101010; b = 8'b01010101; c_in = 0; #10;
        $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, c_in, sum, c_out);

        a = 8'b11110000; b = 8'b00001111; c_in = 1; #10;
        $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, c_in, sum, c_out);

        $finish;
    end
endmodule
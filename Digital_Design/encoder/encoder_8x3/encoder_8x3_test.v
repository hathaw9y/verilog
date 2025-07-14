`timescale 1ns/1ps

module encoder_8x3_tb;
    reg [7:0] D;
    wire x, y, z;

    encoder_8x3 uut (
        .D(D),
        .x(x),
        .y(y),
        .z(z)
    );

    integer i;

    initial begin
        $display("D         | x y z");
        $display("-------------------");
        for (i = 0; i < 8; i = i + 1) begin
            D = 8'b00000000;
            D[i] = 1'b1;   // Only one input is active
            #10;
            $display("%b | %b %b %b", D, x, y, z);
        end
        $finish;
    end
endmodule
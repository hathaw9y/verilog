`timescale 1ns/1ps

module encoder_8x4_prior_tb;
    reg [7:0] D;
    wire x, y, z, V;

    encoder_8x4_prior uut (
        .D(D),
        .x(x),
        .y(y),
        .z(z),
        .V(V)
    );

    integer i;

    initial begin
        $display("D[0] D[1] D[2] D[3] D[4] D[5] D[6] D[7]| x y z V");
        $display("-------------------------");
        for (i = 0; i < 256; i = i + 1) begin
            D = i[7:0];
            #10;
            $display("%b    %b    %b    %b    %b    %b    %b    %b   | %b %b %b %b", D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7], x, y, z, V);
        end
        $finish;
    end
endmodule
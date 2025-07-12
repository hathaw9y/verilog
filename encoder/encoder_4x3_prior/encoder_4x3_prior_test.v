`timescale 1ns/1ps

module encoder_4x3_prior_tb;
    reg [3:0] D;
    wire x, y, V;

    encoder_4x3_prior uut (
        .D(D),
        .x(x),
        .y(y),
        .V(V)
    );

    integer i;

    initial begin
        $display("D[0] D[1] D[2] D[3] | x y V");
        $display("-------------------------");
        for (i = 0; i < 16; i = i + 1) begin
            D = i[3:0];
            #10;
            $display("%b    %b    %b    %b | %b %b %b", D[0], D[1], D[2], D[3], x, y, V);
        end
        $finish;
    end
endmodule
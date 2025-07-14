`timescale 1ns/1ps

module decoder_2x3x8_tb;
    reg x, y, z, w;
    wire [0:15] D;

    // DUT 인스턴스
    decoder_2x3x8 uut (
        .x(x), .y(y), .z(z), .w(w),
        .D(D)
    );

    integer i;

    initial begin
        $display(" x y z w | D");
        $display("---------------");

        for (i = 0; i < 16; i = i + 1) begin
            {w, x, y, z} = i[3:0];
            #10;
            $display(" %b %b %b %b | %b", x, y, z, w, D);
        end

        $finish;
    end
endmodule
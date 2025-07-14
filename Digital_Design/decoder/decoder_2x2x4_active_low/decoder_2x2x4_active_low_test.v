`timescale 1ns/1ps

module decoder_2x2x4_active_low_tb;
    reg x, y, z, w;
    wire [0:7] D;

    // DUT 인스턴스
    decoder_2x2x4_active_low uut (
        .x(x), .y(y), .enable(w),
        .D(D)
    );

    integer i;

    initial begin
        $display(" x y e | D");
        $display("---------------");

        for (i = 0; i < 8; i = i + 1) begin
            {w, x, y} = i[2:0];
            #10;
            $display(" %b %b %b | %b", w, x, y, D);
        end

        $finish;
    end
endmodule
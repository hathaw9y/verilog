`timescale 1ns/1ps

module mux_4x1_tb;
    reg a, b, c, d;
    reg s0, s1;
    wire out;

    mux_4x1 uut (
        .a(a), .b(b), .c(c), .d(d),
        .s0(s0), .s1(s1),
        .out(out)
    );

    initial begin
        $display("s1 s0 | a b c d | out");
        $display("---------------------");

        // 각 입력에 대해 선택선 조합 테스트
        a = 1; b = 0; c = 0; d = 0;
        s1 = 0; s0 = 0; #10; $display(" %b  %b | %b %b %b %b |  %b", s1, s0, a, b, c, d, out);

        a = 0; b = 1; c = 0; d = 0;
        s1 = 0; s0 = 1; #10; $display(" %b  %b | %b %b %b %b |  %b", s1, s0, a, b, c, d, out);

        a = 0; b = 0; c = 1; d = 0;
        s1 = 1; s0 = 0; #10; $display(" %b  %b | %b %b %b %b |  %b", s1, s0, a, b, c, d, out);

        a = 0; b = 0; c = 0; d = 1;
        s1 = 1; s0 = 1; #10; $display(" %b  %b | %b %b %b %b |  %b", s1, s0, a, b, c, d, out);

        $finish;
    end
endmodule
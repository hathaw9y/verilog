`timescale 1ns/1ps

module testbench;
    reg A, B, enable;
    wire [3:0] D;

    // DUT 인스턴스화 (모듈 이름은 decoder_2x4_gates로 가정)
    decoder_2x4_gates uut (
        .D(D),
        .A(A),
        .B(B),
        .enable(enable)
    );

    integer i;

    initial begin
        $display("Enable A B | D");
        $display("------------------");

        // enable = 0인 상태 테스트 (출력은 모두 1이어야 함)
        enable = 0;
        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i[1:0];
            #10;
            $display("   %b    %b %b | %b", enable, A, B, D);
        end

        // enable = 1인 상태 테스트
        enable = 1;
        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i[1:0];
            #10;
            $display("   %b    %b %b | %b", enable, A, B, D);
        end

        $finish;
    end
endmodule
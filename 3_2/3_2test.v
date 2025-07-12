module testbench;
    reg A, B, C, D;
    wire E, F;

    V3_2 uut (  // 필요 시 모듈 이름 수정
        .A(A), .B(B), .C(C), .D(D),
        .E(E), .F(F)
    );

    initial begin
        $display("A B C D | E F");
        $display("---------------");

        // 예시 테스트 벡터 몇 개 (원하면 전체 16개 조합도 가능)
        A = 0; B = 0; C = 0; D = 0; #10;
        $display("%b %b %b %b | %b %b", A, B, C, D, E, F);

        A = 0; B = 1; C = 0; D = 1; #10;
        $display("%b %b %b %b | %b %b", A, B, C, D, E, F);

        A = 1; B = 0; C = 1; D = 0; #10;
        $display("%b %b %b %b | %b %b", A, B, C, D, E, F);

        A = 1; B = 1; C = 0; D = 0; #10;
        $display("%b %b %b %b | %b %b", A, B, C, D, E, F);

        A = 1; B = 1; C = 1; D = 0; #10;
        $display("%b %b %b %b | %b %b", A, B, C, D, E, F);

        A = 1; B = 1; C = 1; D = 1; #10;
        $display("%b %b %b %b | %b %b", A, B, C, D, E, F);

        $finish;
    end
endmodule
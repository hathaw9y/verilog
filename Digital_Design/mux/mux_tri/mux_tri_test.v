module mux_tri_tb;
    reg A, B, select;
    wire m_out;

    // DUT (Device Under Test)
    mux_tri uut (
        .m_out(m_out),
        .A(A),
        .B(B),
        .select(select)
    );

    initial begin
        $display("Time | A B Sel | m_out");
        $display("------------------------");

        A = 0; B = 0;

        select = 0; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        select = 1; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        A = 1; B = 0;
        select = 0; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        select = 1; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        A = 0; B = 1;
        select = 0; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        select = 1; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        A = 1; B = 1;
        select = 0; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        select = 1; #10;
        $display("%4t | %b %b  %b  |   %b", $time, A, B, select, m_out);

        $finish;
    end
endmodule
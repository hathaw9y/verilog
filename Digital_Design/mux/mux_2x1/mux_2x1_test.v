

`timescale 1ns/1ps

module mux_2x1_tb;
    reg a, b, sel;
    wire out;

    // DUT 인스턴스
    mux_2x1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("sel a b | out");
        $display("---------------");

        sel = 0; a = 0; b = 0; #10;
        $display("  %b   %b %b |  %b", sel, a, b, out);

        sel = 0; a = 1; b = 0; #10;
        $display("  %b   %b %b |  %b", sel, a, b, out);

        sel = 1; a = 0; b = 1; #10;
        $display("  %b   %b %b |  %b", sel, a, b, out);

        sel = 1; a = 1; b = 1; #10;
        $display("  %b   %b %b |  %b", sel, a, b, out);

        $finish;
    end
endmodule
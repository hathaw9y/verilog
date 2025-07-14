module mux_2x1(a, b, sel, out);
    input a, b, sel;
    output out;

    assign out = (sel) ? a: b;
endmodule
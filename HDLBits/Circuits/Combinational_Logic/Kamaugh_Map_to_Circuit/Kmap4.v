module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    assign out = (a + b + c + d == 1) ? 1 : (a + b + c + d == 3) ? 1 : 0;

endmodule

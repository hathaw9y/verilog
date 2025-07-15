module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire t1;
    xnor (t1, in1, in2);
    xor (out, t1, in3);

endmodule

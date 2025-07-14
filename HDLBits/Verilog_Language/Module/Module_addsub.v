module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] t1;
    assign t1 = b ^ {32{sub}};

    wire t2, t3;
    add16 inst1(a[15:0], t1[15:0], sub, sum[15:0], t2);
    add16 inst2(a[31:16], t1[31:16], t2, sum[31:16], t3);
endmodule

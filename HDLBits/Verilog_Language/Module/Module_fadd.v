module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);  
    wire t1, t2;
    add16 inst1 (a[15:0], b[15:0], 1'b0, sum[15:0], t1);
    add16 inst2 (a[31:16], b[31:16], t1, sum[31:16], t2);

endmodule


module add1 ( input a, input b, input cin,   output sum, output cout );
    wire t1, t2, t3;
    xor (t1, a, b);
    and (t2, a, b);
    xor (sum, t1, cin);
    and (t3, t1, cin);
    or (cout, t2, t3);
endmodule

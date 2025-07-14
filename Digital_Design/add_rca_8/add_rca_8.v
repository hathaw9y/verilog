module add_half(input a,b, output carry, sum);
    xor (sum, a,b);
    and (carry, a, b);
endmodule

module add_full(input a, b, c_in, output c_out, sum);
    wire c, s, w;
    add_half HA1 (a, b, c, s);
    add_half HA2 (s, c_in,  w, sum);
    or (c_out, c, w);
endmodule

module add_rca_4(input [3:0] a, b, input c_in, output c_out, output [3:0] sum);
    wire w1, w2, w3;
    add_full HF1 (a[0], b[0], c_in, w1, sum[0]);
    add_full HF2 (a[1], b[1], w1, w2, sum[1]);
    add_full HF3 (a[2], b[2], w2, w3, sum[2]);
    add_full HF4 (a[3], b[3], w3, c_out, sum[3]);
endmodule

module add_rca_8(input [7:0] a, b, input c_in, output c_out, output [7:0] sum);
    wire w;
    add_rca_4 RCA1 (a[3:0], b[3:0], c_in, w, sum[3:0]);
    add_rca_4 RCA2 (a[7:4], b[7:4], w, c_out, sum[7:4]);
endmodule
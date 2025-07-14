`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire t1, t2;
    and (t1, a,b);
    and (t2, c,d);

    or (out, t1, t2);
    not (out_n, out);

endmodule

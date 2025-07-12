module encoder_4x3_prior(D, x, y, V);
    input [3:0] D;
    output x, y, V;
    wire d2_not;

    not (d2_not, D[2]);
        
    or (x, D[3], D[2]);
    or (V, D[3], D[2], D[1], D[0]);

    wire t;
    and (t, D[1], d2_not);
    or (y, D[3], t);
endmodule
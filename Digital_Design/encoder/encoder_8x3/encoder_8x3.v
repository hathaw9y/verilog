module encoder_8x3(D, x, y, z);
    input [7:0] D;
    output x, y, z;

    or G1 (x, D[4], D[5], D[6], D[7]);
    or G2 (y, D[2], D[3], D[6], D[7]);
    or G3 (z, D[1], D[3], D[5], D[7]);
endmodule
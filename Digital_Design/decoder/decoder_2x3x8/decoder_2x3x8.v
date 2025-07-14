module decoder_2x3x8(x,y,z,w, D);
    output [0:15] D;
    input x, y, z, w;
    wire x_not, y_not, z_not, w_not;

    not G1 (x_not, x);
    not G2 (y_not, y);
    not G3 (z_not, z);
    not G4 (w_not, w);

    nand G5 (D[0], x_not, y_not, z_not, w_not);
    nand G6 (D[1], x_not, y_not, z, w_not);
    nand G7 (D[2], x_not, y, z_not, w_not);
    nand G8 (D[3], x_not, y, z, w_not);
    nand G9 (D[4], x, y_not, z_not, w_not);
    nand G10 (D[5], x, y_not, z, w_not);
    nand G11 (D[6], x, y, z_not, w_not);
    nand G12 (D[7], x, y, z, w_not);

    nand G13 (D[8], x_not, y_not, z_not, w);
    nand G14 (D[9], x_not, y_not, z, w);
    nand G15 (D[10], x_not, y, z_not, w);
    nand G16 (D[11], x_not, y, z, w);
    nand G17 (D[12], x, y_not, z_not, w);
    nand G18 (D[13], x, y_not, z, w);
    nand G19 (D[14], x, y, z_not, w);
    nand G20 (D[15], x, y, z, w);

endmodule
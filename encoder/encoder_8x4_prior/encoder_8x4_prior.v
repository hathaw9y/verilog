module encoder_8x4_prior(D, x, y, z, V);
    input [7:0] D;
    output x, y, z;
    output V;

    or (V, D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7]);
    or (x, D[4], D[5], D[6], D[7]);
    //y
    wire d4_nor_d5;
    nor (d4_nor_d5, D[4], D[5]);
    wire d2_or_d3;
    or (d2_or_d3, D[2], D[3]);
    wire t_y1;
    and (t_y1, d4_nor_d5, d2_or_d3);
    or (y, D[7], D[6], t_y1);
    //z
    wire d6_not,d4_not, d2_not;
    not (d6_not, D[6]);
    not (d4_not, D[4]);
    not (d2_not, D[2]);
    wire t_z1, t_z2, t_z3;
    and (t_z1, D[5], d6_not);
    and (t_z2, D[3], d6_not, d4_not);
    and (t_z3, D[1], d6_not, d4_not, d2_not);
    or (z, D[7], t_z1, t_z2, t_z3);


endmodule
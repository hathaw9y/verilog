module decoder_2x2x4_active_low(x, y, enable, D);
    output [0:7] D;
    input x, y;
    input enable;
    wire x_not, y_not, enable_not;

    not G1 (x_not, x);
    not G2 (y_not, y);
    not G3 (enable_not, enable);

    and G4 (D[0], x_not, y_not, enable_not);
    and G5 (D[1], x_not, y, enable_not);
    and G6 (D[2], x, y_not, enable_not);
    and G7 (D[3], x, y, enable_not);

    and G8 (D[4], x_not, y_not, enable);
    and G9 (D[5], x_not, y, enable);
    and G10 (D[6], x, y_not, enable);
    and G11 (D[7], x, y, enable);
endmodule
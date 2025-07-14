module decoder_2x4_gates(D, A, B, enable);
    output [3:0] D;
    input A, B;
    input enable;
    wire A_not, B_not, enable_not;

    not G1 (A_not, A);
    not G2 (B_not, B);
    not G3 (enable_not, enable);
    
    nand G4 (D[0], A_not, B_not, enable_not);
    nand G5 (D[1], A_not, B, enable_not);
    nand G6 (D[2], A, B_not, enable_not);
    nand G7 (D[3], A, B, enable_not);
endmodule
    
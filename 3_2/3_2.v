module V3_2(
    input A,
    input B,
    input C,
    input D,
    output E,
    output F
);
    assign E = A | (B&C) | (~B & D);
    assign F = (~B & C) | (B & ~C & ~D);
endmodule
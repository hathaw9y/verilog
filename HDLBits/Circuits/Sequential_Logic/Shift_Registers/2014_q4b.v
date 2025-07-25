module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF dff0 (KEY[0], KEY[1], KEY[2], KEY[3], SW[3], LEDR[3]);
    MUXDFF dff1 (KEY[0], KEY[1], KEY[2], LEDR[3], SW[2], LEDR[2]);
    MUXDFF dff2 (KEY[0], KEY[1], KEY[2], LEDR[2], SW[1], LEDR[1]);
    MUXDFF dff3 (KEY[0], KEY[1], KEY[2], LEDR[1], SW[0], LEDR[0]);

endmodule

module MUXDFF (
    input clk,
    input E,
    input L,
    input w,
    input r,
    output q
);
    always @(posedge clk) begin
        if (L)
            q<= r;
        else if (E)
            q <= w;
        else
            q <= q;
    end
endmodule
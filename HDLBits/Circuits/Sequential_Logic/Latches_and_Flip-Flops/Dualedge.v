module top_module (
    input clk,
    input d,
    output q
);

    reg q_pos, q_neg;

    always @(posedge clk)
        q_pos <= d ^ q_neg;

    always @(negedge clk)
        q_neg <= d ^ q_pos;

    assign q = q_pos ^ q_neg;

endmodule

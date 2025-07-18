module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev_in;
    always @(posedge clk) begin
        if (prev_in & ~in)
            out <= out | (prev_in & ~in);
        
        prev_in <= in;
        if (reset) 
            out <= 32'h0;
    end

endmodule

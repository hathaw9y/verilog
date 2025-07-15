module top_module (
    input clk,
    input in, 
    output out);
    reg q;
    wire D;
    xor (D, in, q); 
    always @(posedge clk) begin
        q <= D;
        out <= D;
    end   

endmodule

module top_module (
    input clk,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if (reset) 
            q = 4'b0001;
        else begin
            if (q == 4'b1010)
                q = 4'b0001;
            else if (q == 4'b0000)
                q = 4'b0001;
            else
                q = q + 1;
        end
    end

endmodule

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    integer i = 4;
    always @(posedge clk) begin
        if (reset) 
            q <= 5'h1;
        else begin
            for (i = 4; i>= 0; i = i - 1) begin
                if (i == 4)
                    q[i] <= q[0] ^ 0;
                else if (i == 2)
                    q[i] <= q[3] ^ q[0];
                else
                    q[i] <= q[i+1];
                    
            end
        end
    end
endmodule

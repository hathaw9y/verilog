module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    count10 cnt0 (clk, reset, 1, q[3:0]);
    count10 cnt1 (clk, reset, ena[1], q[7:4]);
    count10 cnt2 (clk, reset, ena[2], q[11:8]);
    count10 cnt3 (clk, reset, ena[3], q[15:12]);
    assign ena[1] = (q[3:0] == 4'b1001);
    assign ena[2] = (q[7:4] == 4'b1001 && q[3:0] == 4'b1001);
    assign ena[3] = (q[11:8] == 4'b1001 && q[7:4] == 4'b1001 && q[3:0] == 4'b1001);
    
endmodule

module count10(
    input clk,
    input reset,
    input enable,
    output [3:0] q);
    always @(posedge clk) begin
        if (reset)
            q<= 4'b0;
        else if (enable) begin
            if (q == 4'b1001) begin
                q <= 4'b0;
            end else begin
                q <= q + 1;
            end
        end
    end
endmodule

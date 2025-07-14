module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire t1, t2, t3;
    wire [15:0] sum1, sum2;
    add16 inst1 (a[15:0], b[15:0], 1'b0, sum[15:0], t1);
    add16 inst2 (a[31:16], b[31:16], 1'b0, sum1, t2);
    add16 inst3 (a[31:16], b[31:16], 1'b1, sum2, t3);
    always @(*) begin
        case (t1)
            1'b0: sum[31:16] = sum1;
            1'b1: sum[31:16] = sum2;
        endcase
    end
endmodule

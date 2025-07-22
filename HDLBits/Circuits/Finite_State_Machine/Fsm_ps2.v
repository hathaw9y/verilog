module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    reg [1:0] state, next_state;
    parameter F =0, S = 1, T = 2, Fo = 3;

    // State transition logic (combinational)
    always @(*) begin
        case (state)
            F: next_state = (in[3]) ? S : F;
            S: next_state = T;
            T: next_state = Fo;
            Fo: next_state = (in[3]) ? S : F;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) begin
            state <= F;
        end else begin
            state <= next_state;
        end
    end
 
    // Output logic
    assign done = (state == Fo);

endmodule

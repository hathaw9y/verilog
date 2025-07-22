module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg [1:0] state, next_state;
    parameter F =0, S = 1, T = 2, Fo = 3;
    // FSM from fsm_ps2

    // New: Datapath to store incoming bytes.
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
            case (state)
                F: out_bytes[23: 16] <= in;
                S: out_bytes[15: 8] <= in;
                T: out_bytes[7: 0] <= in;
                Fo: out_bytes[23: 16] <= in;
            endcase
        end
    end
 
    // Output logic
    assign done = (state == Fo);


endmodule

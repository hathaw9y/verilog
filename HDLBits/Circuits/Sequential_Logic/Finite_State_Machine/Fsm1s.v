// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 1'b0, B = 1'b1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state <= B;
            out <= B;
            // Fill in reset logic
        end else begin
            case (present_state)
                // Fill in state transition logic
                A: if (in == 0) next_state = B; else next_state = A;
                B: if (in == 0) next_state = A; else next_state = B;
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
                A: out = 0;
                B: out = 1;
            endcase
        end
    end

endmodule

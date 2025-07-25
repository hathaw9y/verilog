module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // State transition logic
    parameter A = 0, B =1, C=2, D=3;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            A: next_state= (in) ? B : A;
            B: next_state= (in) ? B : C;
            C: next_state= (in) ? D : A;
            D: next_state= (in) ? B : C;
        endcase
    end

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    // Output logic
    assign out = (state == D) ? 1 : 0;
    
endmodule
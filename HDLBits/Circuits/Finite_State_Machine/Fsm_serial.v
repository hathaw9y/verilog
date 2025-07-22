module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [3:0] state, next_state;
    parameter IDLE = 0, START =1, S1 = 2, S2 = 3, S3 = 4, S4 = 5, S5 = 6, S6 = 7, S7 = 8, S8 = 9, STOP = 10, SUCC = 11, ERR = 12;

    always @(*) begin
        case (state)
            IDLE: next_state = (in) ? IDLE : START;
            START: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S7;
            S7: next_state = STOP;
            STOP: next_state = (in) ? SUCC : ERR;
            SUCC: next_state = (in) ? IDLE : START;
            ERR: next_state = (in) ? IDLE : ERR;
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end
    assign done = (state == SUCC);

endmodule

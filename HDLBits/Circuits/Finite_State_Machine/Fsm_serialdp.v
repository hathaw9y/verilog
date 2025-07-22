module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    reg [3:0] state, next_state;
    parameter IDLE = 0, START =1, S1 = 2, S2 = 3, S3 = 4, S4 = 5, S5 = 6, S6 = 7, S7 = 8, S8 = 9, STOP = 10, SUCC = 11, ERR = 12, PAR = 13;
    reg odd;
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
            S7: next_state = PAR;
            PAR: next_state = (in != odd) ? STOP : ERR;
            STOP: next_state = (in) ? SUCC : ERR;
            SUCC: next_state = (in) ? IDLE : START;
            ERR: next_state = (in) ? IDLE : ERR;
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else begin
            state <= next_state;
            if (state > 0 & state <9) 
                out_byte[state -1] = in;
        end
    end

    parity par1 (clk, reset, in, odd);
    assign done = (state == SUCC);

endmodule

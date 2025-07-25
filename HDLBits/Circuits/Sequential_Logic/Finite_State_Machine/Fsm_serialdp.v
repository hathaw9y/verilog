module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    reg [2:0] state, next_state;
    parameter IDLE = 0, DATA = 1, STOP = 2, DONE = 3, ERR = 4;
    reg odd;

    parity par1(clk, ~(state == DATA), in, odd);

    integer cnt;

    always @(*) begin
        case (state)
            IDLE: next_state = (~in) ? DATA : IDLE;
            DATA: next_state = (cnt == 9 && in == ~odd) ? STOP : (cnt == 9 && in == odd) ? ERR : DATA;
            STOP: next_state = (in) ? DONE : ERR;
            DONE: next_state = (~in) ? DATA : IDLE;
            ERR: next_state = (in) ? IDLE : ERR;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            cnt <= 0;
        end else begin
            state <= next_state;
            if (next_state == DATA) begin
                cnt = cnt + 1;
                if (cnt > 1)
                    out_byte[cnt - 2] <= in;
            end else if (next_state == DONE || next_state == ERR) begin
                cnt = 0;
            end
        end
    end

    assign done = (state == DONE);

endmodule
module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    int cnt;
    reg state, next_state;
    parameter ZERO = 0, ONE = 1;

    always @(*) begin
        next_state = in;
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= ZERO;
            cnt <= 0;
        end else begin
            state <= next_state;
            if (state == ZERO && next_state)
                cnt = 1;
            else if (next_state == ONE)
                cnt = cnt + 1;
        end
    end

    assign disc = (state == ZERO && cnt == 5);
    assign flag = (state == ZERO && cnt == 6);
    assign err = (state != ZERO && cnt > 6);

endmodule

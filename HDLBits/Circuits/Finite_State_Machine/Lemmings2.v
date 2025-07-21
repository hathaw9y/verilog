module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    reg [1:0] state, next_state, prev_state;
    parameter LEFT = 0, RIGHT =1, AAAH =2;

    always @(*) begin
        case(state)
            LEFT: next_state = ground ? (bump_left  ? RIGHT : LEFT)  : AAAH;
            RIGHT: next_state = ground ? (bump_right ? LEFT  : RIGHT) : AAAH;
            AAAH: next_state = ground ? prev_state : AAAH;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= LEFT;
        end
        else begin
            state <= next_state;
            if (!ground && (state == LEFT || state == RIGHT))
                prev_state <= state;
        end
    end

    assign walk_left = (state == LEFT) ? 1 : 0;
    assign walk_right = (state == RIGHT) ? 1 : 0;
    assign aaah = (state == AAAH) ? 1 : 0;
endmodule

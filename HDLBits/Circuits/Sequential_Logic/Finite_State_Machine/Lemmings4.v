module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    reg [2:0] state, next_state, prev_state;
    parameter LEFT = 0, RIGHT =1, AAAH =2, DIGG = 3, OOPS=4;
    integer counter;

    always @(*) begin
        case (state)
            LEFT: next_state = (ground & ~dig) ? (bump_left ? RIGHT : LEFT) : (ground) ? DIGG : AAAH;
            RIGHT: next_state = (ground & ~dig) ? (bump_right ? LEFT : RIGHT) : (ground) ? DIGG : AAAH;
            AAAH: begin
                next_state = (ground) ? ((counter >19) ? OOPS : prev_state) : AAAH;
            end
            DIGG: next_state = (ground) ? DIGG : AAAH;
            OOPS: next_state = OOPS;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)begin
            state <= LEFT;
            counter <= 0;
        end
        else begin
            state <= next_state;
            if ((!ground || dig) && (state == LEFT || state == RIGHT))
                prev_state <= state;
            if (state == AAAH)
                counter <= counter + 1;
            else
                counter <= 0;
        end
    end
    assign walk_left = (state == LEFT) ? 1 : 0;
    assign walk_right = (state == RIGHT) ? 1 : 0;
    assign aaah = (state == AAAH) ? 1 : 0;
    assign digging = (state == DIGG) ? 1 : 0;
endmodule

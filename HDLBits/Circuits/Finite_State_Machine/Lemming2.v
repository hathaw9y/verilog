module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    reg [1:0] state, next_state;
    parameter LEFT = 0, RIGHT =1, AAAH = 2;

    always @(*) begin
        case (state)
        asdf
        
    end

endmodule

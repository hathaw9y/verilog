module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );

    reg[2:0] state;
    reg next_state;

    always @(*) begin
        next_state = x;
    end

    always @(posedge clk, negedge aresetn) begin
        if (~aresetn) begin
            state <=0;
        end else begin
            state <= {state[1:0], next_state};
        end
    end

    assign z = (state[1:0] == 2'b10 & next_state == 1);
endmodule

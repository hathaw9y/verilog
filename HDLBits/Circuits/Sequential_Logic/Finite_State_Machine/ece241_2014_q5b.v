module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg state, next_state;
    parameter A =0, B=1;

    always @(*) begin
        case (state)
            A: next_state = (x) ? B : A;
            B: next_state = B;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)
            state = A;
        else begin
            state <= next_state;
        end
    end

    assign z = (state) ? ~x : x;

endmodule

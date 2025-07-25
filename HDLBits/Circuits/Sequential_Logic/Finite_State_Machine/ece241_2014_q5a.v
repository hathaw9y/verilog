module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg state, next_state, next_z;
    always @(*) begin
        case (state)
            0: begin
                next_z = x;
                if (x ==1)
                    next_state = 1;
                else
                    next_state =0;
            end
            1: begin
                next_z = ~x;
                next_state =1;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= 0;
            z <= 0;
        end
        else begin
            state <= next_state;
            z <= next_z;
        end
    end 


endmodule

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    reg state, next_state;
    parameter A= 0, B =1;
    reg [1:0] cnt, timer;

    always @(*) begin
        case (state)
            A: next_state = (s) ? B : 0;
            B: next_state = B;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            timer <= 0;
            cnt <= 0;
        end
        else begin
            state <= next_state;
            if (state == B) begin
                if (timer == 3)begin
                    timer = 0;
                    cnt = 0;
                end
                cnt = cnt + w;
                timer = timer + 1;
            end
        end
    end

    assign z = (timer == 3 & cnt == 2);

endmodule

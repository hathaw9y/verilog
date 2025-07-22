module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    integer i;
    reg [9:0] tmp_state;


    always @(*) begin
        next_state = 0;
        out1 = 0;
        out2 = 0;
        for (i = 0; i < 10; i = i + 1) begin
            if (state[i]) begin
                if (i == 9) begin
                    tmp_state = (in) ? 10'b00_0000_0010 : 10'b00_0000_0001;
                    out1 = out1 | 1;
                    out2 = out2 | 1;
                end
                else if (i == 8) begin
                    tmp_state = (in) ? 10'b00_0000_0010 : 10'b00_0000_0001;
                    out1 = out1 | 1;
                end
                else if (i == 7) begin
                    tmp_state = (in) ? 10'b00_1000_0000 : 10'b00_0000_0001;
                    out2 = out2 |1;
                end 
                else if (i == 6) begin
                    tmp_state = (in) ? 10'b00_1000_0000 : 10'b10_0000_0000;
                end
                else if (i == 5)begin
                    tmp_state = (in) ? 10'b00_0100_0000 : 10'b01_0000_0000;
                end
                else begin
                    tmp_state = (in) ? 10'b1 << (i+1) : 10'b00_0000_0001;
                end
                next_state = next_state|tmp_state;
            end
        end
    end

endmodule

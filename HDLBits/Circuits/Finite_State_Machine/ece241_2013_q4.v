module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg[1:0] state, next_state;
    parameter s0 =0, s1= 1, s2= 2, s3= 3;
    always @(*) begin
        case (state)
            s0: next_state = (s[1]) ? s1 : s0;
            s1: next_state = (s[2]) ? s2 : (s[1]) ? s1 : s0;
            s2: next_state = (s[3]) ? s3 : (s[2]) ? s2 : s1;
            s3: next_state = (s[3]) ? s3 : s2;
        endcase 
    end
    always @(posedge clk) begin
        if (reset)begin
            state = s0;
            dfr = 1;
        end
        else begin
            if (state != next_state)
                dfr <= (state > next_state);
            state <=next_state;
        end
    end

    assign fr3 = (state == s0);
    assign fr2 = (state == s1 | state == s0);
    assign fr1 = (state == s2 | state == s1 | state == s0);

    
endmodule

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    reg [3:0] state, next_state;
    reg reset_state;
    parameter Z=0, A0=1, A1 =2, B0 = 3, B1 =4, B2= 5, C=6, C1=7, C0=8, C00= 9;

    always @(posedge clk) begin
        if (~resetn)
            state <= A0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            A0: next_state = A1;
            A1: next_state = B0;
            B0: next_state = (x)? B1 : B0;
            B1: next_state = (x)? B1 : B2;
            B2: next_state = (x)? C : B0;
            C: next_state = (y)? C1 : C0;
            C1: next_state = C1;
            C0: next_state = (y)? C1 : C00;
            C00: next_state = C00;
            default: next_state = A0;
        endcase
    end

    assign f = (state==A1);
    assign g = (state==C | state ==C1 | state==C0);

endmodule

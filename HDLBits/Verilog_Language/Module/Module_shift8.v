module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] t1, t2, t3;
    my_dff8 inst1(clk, d, t1);
    my_dff8 inst2(clk, t1, t2);
    my_dff8 inst3(clk, t2, t3);

    always @(*) begin
        case(sel)
            2'b00: q = d;
            2'b01: q = t1;
            2'b10: q = t2;
            2'b11: q = t3;
        endcase
    end
endmodule

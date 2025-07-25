module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    always @(*) begin
        case (y)
            3'b000 : Y0 = (x) ? 1 : 0;
            3'b001 : Y0 = (x) ? 0 : 1;
            3'b010 : Y0 = (x) ? 1 : 0;
            3'b011 : Y0 = (x) ? 0 : 1;
            3'b100 : Y0 = (x) ? 0 : 1;
        endcase
    end

    assign z = (y ==3'b011 | y ==3'b100);

endmodule

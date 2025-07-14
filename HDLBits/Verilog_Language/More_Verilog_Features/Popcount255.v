module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i, j;
    always @(*) begin
        j = 0;
        for (i = 0; i <255; i = i +1)begin
            if (in[i]) j = j + 1;
        end
        out = j;
    end

endmodule

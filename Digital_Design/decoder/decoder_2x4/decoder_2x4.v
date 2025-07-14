module decoder_2x4(output reg [3:0] D, input A, B, enable);
    always @(A, B, enable) begin
        D[0] = ~((~A) & (~B) & (~enable));
        D[1] = ~((~A) &  B   & (~enable));
        D[2] = ~( A   & (~B) & (~enable));
        D[3] = ~( A   &  B   & (~enable));
    end
endmodule
module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    integer i;
    integer n, up, down, left, right;
    always @(posedge clk) begin
        if (load)
            q <= data;
        else begin
            for (i= 0; i<256; i= i+1) begin
                n = 4'h0;
                if (i[7:4] == 0)
                    down = 4'hf;
                else
                    down = i[7:4] - 1;
                if (i[7:4] == 15)
                    up = 4'h0;
                else
                    up = i[7:4] + 1;
                if (i[3:0] == 0)
                    left = 4'hf;
                else
                    left = i[3:0] - 1;
                if (i[3:0] == 15)
                    right = 4'h0;
                else
                    right = i[3:0] + 1;
                n = q[up* 16 + left] + q[up* 16 + i[3:0]] + q[up* 16 + right] +
                    q[i[7:4]* 16 + left] + q[i[7:4]* 16 + right] +
                    q[down* 16 + left] + q[down* 16 + i[3:0]] + q[down* 16 + right];

                if (n<2 || n>3)
                    q[i] <= 0;
                else if (n == 3)
                    q[i] <= 1;
                else
                    q[i] <= q[i];
            end
        end
    end
endmodule
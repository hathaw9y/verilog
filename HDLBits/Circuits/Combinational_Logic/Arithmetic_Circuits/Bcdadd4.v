module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [4:0] temp_cout;
    assign temp_cout[0] = cin;

    genvar i;
    generate
        for (i =0; i< 4; i = i + 1) begin : gen_add
            bcd_fadd bcdf(
                .a  (a[i*4 + 3 : i*4]),
                .b   (b[i*4 + 3 : i*4]),
                .cin (temp_cout[i]),
                .cout(temp_cout[i+1]),
                .sum (sum[i*4 + 3 : i*4])
            );
        end
    endgenerate
    assign cout = temp_cout[4]; 

endmodule

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
    wire [8:0] cout;

    assign cout[0] = 0;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_add
            adder_1 adder_inst (
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i]),
                .cout(cout[i+1]),
                .sum(s[i])
            );
        end
    endgenerate

    assign overflow = cout[7] ^ cout[8];

endmodule

module adder_1(input a, b, cin, output cout, sum);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule
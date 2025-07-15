module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] cout;
    adder_1 ad0(.x(x[0]), .y(y[0]), .cin(1'b0), .cout(cout[0]), .sum(sum[0]));
    adder_1 ad1(.x(x[1]), .y(y[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    adder_1 ad2(.x(x[2]), .y(y[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
    adder_1 ad3(.x(x[3]), .y(y[3]), .cin(cout[2]), .cout(sum[4]), .sum(sum[3]));

endmodule

module adder_1(input x, y, cin, output sum, cout);
    assign sum = x ^ y ^ cin;
    assign cout = (x & y) | (cin & (x ^ y));
endmodule
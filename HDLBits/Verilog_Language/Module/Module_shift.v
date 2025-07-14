module top_module ( input clk, input d, output q );
    wire t1, t2;
    my_dff inst1(clk, d, t1);
    my_dff inst2(clk, t1, t2);
    my_dff inst3(clk, t2, q);
endmodule

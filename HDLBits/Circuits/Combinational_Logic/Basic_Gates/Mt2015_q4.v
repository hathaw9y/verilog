module top_module (input x, input y, output z);
    wire t1, t2, t3, t4;
    mda ma1 (.x(x), .y(y), .z(t1));
    mdb mb1 (.x(x), .y(y), .z(t2));
    or (t3, t1, t2);
    and (t4, t1, t2);
    xor (z, t3, t4);
endmodule

module mda (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module mdb ( input x, input y, output z );
    xnor (z ,x ,y);
endmodule

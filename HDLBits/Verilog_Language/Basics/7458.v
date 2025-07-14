module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire t1, t2;
    and (t1, p1a, p1b, p1c);
    and (t2, p1d, p1e, p1f);
    or (p1y, t1, t2);

    wire t3, t4;
    and (t3, p2a, p2b);
    and (t4, p2c, p2d);
    or (p2y, t3, t4);

endmodule

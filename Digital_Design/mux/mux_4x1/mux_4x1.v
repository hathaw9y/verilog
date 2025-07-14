module mux_4x1(a, b, c, d, s0, s1, out);
    input a, b, c, d, s0, s1;
    output out;

    wire s0_not,s1_not;
    not (s0_not, s0);
    not (s1_not, s1);
    
    wire a_and, b_and, c_and, d_and;
    and (a_and, a, s0_not, s1_not);
    and (b_and, b, s0, s1_not);
    and (c_and, c, s0_not, s1);
    and (d_and, d, s0, s1);

    or (out, a_and, b_and, c_and, d_and);
endmodule
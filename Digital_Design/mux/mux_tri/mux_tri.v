module mux_tri(m_out, A, B, select);
    output tri m_out;
    input A, B, select;

    bufif1(m_out, A, select);
    bufif0(m_out, B, select);
endmodule
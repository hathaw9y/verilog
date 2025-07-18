module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    reg ena1, ena2, ena3, ena4;
    mcdcount counter0 (clk, reset, ena, 4'b1001, ss[3:0]);
    mcdcount counter1 (clk, reset, ena & ena1, 4'b0101, ss[7:4]);
    mcdcount counter2 (clk, reset, ena & ena2, 4'b1001, mm[3:0]);
    mcdcount counter3 (clk, reset, ena & ena3, 4'b0101, mm[7:4]);
    hour_counter counter4 (clk, reset, ena4, hh, pm);
    
    assign ena1 = (ss[3:0] == 4'b1001);
    assign ena2 = (ss[7:4] == 4'b0101 && ss[3:0] == 4'b1001);
    assign ena3 = (mm[3:0] == 4'b1001 && ss[7:4] == 4'b0101 && ss[3:0] == 4'b1001);
    assign ena4 = (mm[7:4] == 4'b0101 && mm[3:0] == 4'b1001 && ss[7:4] == 4'b0101 && ss[3:0] == 4'b1001);

endmodule

module mcdcount(
    input clk,
    input reset,
    input ena,
    input [3:0] limit,
    output [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0;
        else if (ena) begin
            if (q == limit) begin
                q <= 4'b0;
            end else begin
                q <= q + 1;
            end
        end
    end
endmodule

module hour_counter(
    input clk,
    input reset,
    input ena,
    output [7:0] hh,
    output pm
);
    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'b00010010;
            pm <= 1'b0; 
        end else if (ena) begin
            if (hh == 8'b00010010)
                hh <= 8'b00000001;
            else if (hh == 8'b00001001)
                hh <= 8'b00010000;
            else
                hh <= hh + 1;
            if (hh == 8'b00010001) 
               pm <= ~pm;
        end
    end
            
endmodule
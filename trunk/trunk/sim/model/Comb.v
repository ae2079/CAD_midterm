`timescale 1ns/1ns

module Comb (input clk, rst, start,input [3:0] N, M,output done,output [12:0] out_);
wire [1:0] Flag_In, Sm, Sn, Flag_Out;
wire Sc, weN, weM, wen, wem, we1, we2, pop, top, push, Lend, end_;

DataPath DP(N, M, Sm, Sn, Flag_In, Sc, weN, weM, wen, wem, we1, we2, pop, top, push, clk, rst, Flag_Out, Lend, end_, out_);
Controller CTRL(clk, rst, start, Lend, end_, Flag_Out, Sm, Sn, Sc, Flag_In, weN, weM, wen, wem, we1, we2, pop, top, push, done);

endmodule
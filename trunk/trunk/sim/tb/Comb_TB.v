`timescale 1ns/1ns

module Comb_TB();
 reg clk = 1'b0 , rst = 1'b0;
 wire [12: 0] out_;
 reg start=1'b0;
 reg [3:0]N=0, M=0;
 wire done;
 always #5 clk = ~clk;

 Comb UUT(clk, rst, start, N, M, done, out_);
 initial begin
	rst = 1;
	#25;
	N=3;
   	M=2;
   	rst=1'b0;
   	start=1'b1;
   	#100;
   	start=1'b0;
   	#400;
	N=8;
   	M=4;
   	rst=1'b0;
   	start=1'b1;
   	#100;
   	start=1'b0;
	#20000;
	N=7;
   	M=3;
   	rst=1'b0;
   	start=1'b1;
   	#100;
   	start=1'b0;
	#20000;
	N=7;
   	M=4;
   	rst=1'b0;
   	start=1'b1;
   	#100;
   	start=1'b0;
	#20000;
	N=15;
   	M=7;
   	rst=1'b0;
   	start=1'b1;
   	#100;
   	start=1'b0;
	#1000000;
 	$stop;
 end
    
endmodule

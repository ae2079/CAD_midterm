`timescale 1ns/1ns
module reg_4bit(in, write, clk, rst, out);
	input [3:0] in;
	input write, clk, rst;
	output reg [3:0] out;
	
	always @(posedge clk, posedge rst) begin
		if(rst)
			out <= 4'd0;
		else if(write)
			out <= in;
	end

endmodule

module reg_13bit(in, write, clk, rst, out);
	input [12:0] in;
	input write, clk, rst;
	output reg [12:0] out;
	
	always @(posedge clk, posedge rst) begin
		if(rst)
			out <= 13'd0;
		else if(write)
			out <= in;
	end

endmodule

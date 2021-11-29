`timescale 1ns/1ns
module MUX2to1_13bit(A, B, sel, out);
	input [12:0] A, B;
	input sel;
	output [12:0] out;

	assign out = sel ? B : A;

endmodule

module MUX3to1_4bit(A, B, C, sel, out);
	input [3:0] A, B, C;
	input [1:0] sel;
	output [3:0] out;
	
	assign out = (sel == 2'b00) ? A : (sel == 2'b01) ? B : C;
	
endmodule

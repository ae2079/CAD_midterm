`timescale 1ns/1ns
module adder_4bit(A, B, out);
	input [3:0] A, B;
	output [3:0] out;

	assign out = A + B;

endmodule

module adder_13bit(A, B, out);
	input [12:0] A, B;
	output [12:0] out;

	assign out = A + B;

endmodule
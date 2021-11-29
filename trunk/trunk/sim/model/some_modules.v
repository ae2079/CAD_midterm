`timescale 1ns/1ns
module OR_module(in, out);
	input [3:0] in;
	output out;

	or(out, in[0], in[1], in[2], in[3]);

endmodule

module Is_same(A, B, out);
	input [3:0] A, B;
	output out;

	assign out = (A == B);

endmodule

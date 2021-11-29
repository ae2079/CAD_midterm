`timescale 1ns/1ns
module DataPath(N, M, Sm, Sn, Flag_In, Sc, weN, weM, wen, wem, we1, we2, pop, top, push, clk, rst, Flag_Out, Lend, end_, out_);
	input Sc, weN, weM, wen, wem, we1, we2, pop, top, push, clk, rst;
	input [1:0] Sm, Sn, Flag_In;
	input [3:0] N, M;
	output Lend, end_;
	output [1:0] Flag_Out;
	output [12:0] out_;

	wire zero, is_zero, a1, a2, a3;
	wire [3:0] N_out, M_out, n_out, m_out, n_1, m_1;
	wire [12:0] c1_out, c2_out, adder_out;
	wire [22:0] In, Out;
	
	reg_4bit N_reg(N, weN, clk, rst, N_out), M_reg(M, weM, clk, rst, M_out),
		 n_reg(Out[20:17], wen, clk, rst, n_out), m_reg(Out[16:13], wem, clk, rst, m_out);

	reg_13bit comb1_reg(Out[12:0], we1, clk, rst, c1_out),
		  comb2_reg(Out[12:0], we2, clk, rst, c2_out); 

	OR_module o1(m_out, zero);
	
	Is_same is1(n_out, m_out, a1), is2(n_out, N_out, a2), is3(m_out, M_out, a3);

	not n(is_zero, zero);

	or o2(Lend, a1, is_zero);

	and and1(end_, a2, a3);

	Stack stack(In, push, pop, top, clk, rst, Out);

	adder_4bit adder1(n_out, 4'b1111, n_1),
		   adder2(m_out, 4'b1111, m_1);

	MUX3to1_4bit m1(n_out, n_1, N_out, Sn, In[20:17]), m2(m_out, m_1, M_out, Sm, In[16:13]);

	adder_13bit adder3(c1_out, c2_out, adder_out);

	MUX2to1_13bit m3(adder_out, 13'd1, Sc, In[12:0]);

	assign In[22:21] = Flag_In;
	assign out_ = c1_out;
	assign Flag_Out = Out[22:21];
	
endmodule

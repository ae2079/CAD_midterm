`timescale 1ns/1ns

module Controller(clk, rst, start, Lend, end_, Flag_Out, Sm, Sn, Sc, Flag_In, weN, weM, wen, wem, we1, we2, pop, top, push, done);
input clk, start, end_, Lend, rst;
input [1:0] Flag_Out;
output reg [1:0] Sm, Sn, Flag_In;
output reg Sc, weN, weM, wen, wem, we1, we2, pop, top, push, done;

parameter [3:0] init=0, A=1, B=2, C=3, D=4, E=5, F=6, G=7, H=8, I=9, J=10, K=11, M=12, N=13, Final=14;

reg [3:0] ps,ns;
always@(*)begin
case(ps)
	init: ns=(start) ? A:init;
	A: ns=B;
	B: ns=C;
	C: ns=  (Flag_Out==2'b00) ? I:
		(Flag_Out==2'b01) ? I:
		(Flag_Out==2'b10) ? N:
		D;
	D: ns= (end_)? Final: E;
	E: ns=F;
	F: ns=G;
	G: ns=H;
	H: ns=C;
	I: ns=(Lend)? J: K;
	J: ns=C;
	K: ns=M;
	M: ns=C;
	N: ns=C;
	Final: ns=init;
endcase
end
always@(*)begin
{Flag_In, Sm, Sn}=0;
{Sc, weN, weM, wen, wem, we1, we2, pop, top, push, done}=0;
case(ps)
	A: begin weN=1'b1;weM=1'b1;end
	B: begin Sm=2'b10; Sn=2'b10; Flag_In=2'b01;push=1'b1;Sc=1'b1;end
	C: begin top=1'b1;wen=1'b1;wem=1'd1;end
	D: begin pop=1'b1;we1=1'b1;end
	E: begin pop=1'b1;end
	F: begin pop=1'b1;we2=1'b1;end
	G: begin wen=1'b1;wem=1'b1;end
	H: begin Sn=2'b00;Sm=2'b00;Flag_In={1'b1,Flag_Out[0]};push=1'b1;Sc=1'b0;end
	I: begin pop=1'b1;/*wen=1'b1;wem=1'b1;*/end
	J: begin Sm=2'b00;Sn=2'b00;Flag_In={1'b1,Flag_Out[0]};push=1'b1;Sc=1'b1;end
	K: begin Sm=2'b00;Sn=2'b00;Flag_In=Flag_Out;push=1'b1;Sc=1'b1;end
	M: begin Sm=2'b00;Sn=2'b01;Flag_In=2'b00;push=1'b1;Sc=1'b1;end
	N: begin Sn=2'b00;Sm=2'b01;Flag_In=2'b01;push=1'b1;Sc=1'b1;end
	Final: done=1'b1;
endcase
end
always@(posedge clk)begin
	if(rst)
		ps<=init;
	else ps<=ns;
end
endmodule

















	
	
		

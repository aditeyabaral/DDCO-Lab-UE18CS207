module mux_4 (input wire i0,i1,i2,i3, input wire j1, j0, output wire o);
  wire  t0, t1;
  mux2 mux2_0 (i0, i1, j1, t0);
  mux2 mux2_1 (i2, i3,j1, t1);
  mux2 mux2_2 (t0, t1, j0, o);
endmodule

module fa(input wire a,b,c,output wire sum,carry);
	wire t1,t2,t3,t4;
	xor2 u0(a,b,t0);
	xor2 u1(c,t0,sum);
	and2 u2(a,b,t1);
	and2 u3(b,c,t2); 
	and2 u4(c,a,t3);
	or2 u5(t1,t2,t4);
	or2 u6(t3,t4,carry);
endmodule

module addsub(input wire adsub,i0,i1,cin,output wire sumdiff,cout);
	wire t;
	xor2 a1(i1,adsub,t);
	fa a2(i0,t,cin,sumdiff,cout);
endmodule

module alu_slice(input wire [1:0] op,input wire i0,i1,cin,output wire o,cout);
	wire [3:0]t;
	addsub a1(op[0],i0,i1,cin,t[0],cout);
	and2 a2(i0,i1,t[1]);
	or2 a3(i0,i1,t[2]);
	//mux2 a4(t[1],t[2],op[0],t[3]);
	//mux2 a5(t[0],t[3],op[1],o);
	mux_4 a4(t[0],t[0],t[1],t[2],op[0],op[1],o);
endmodule

module alu(input wire [1:0] op,input wire [15:0] i0,i1,output wire [15:0] o,output wire cout);
	wire [14:0]t;
	alu_slice a0(op[1:0],i0[0],i1[0],op[0],o[0],t[0]);
	alu_slice a1(op[1:0],i0[1],i1[1],t[0],o[1],t[1]);
	alu_slice a2(op[1:0],i0[2],i1[2],t[1],o[2],t[2]);
	alu_slice a3(op[1:0],i0[3],i1[3],t[2],o[3],t[3]);
	alu_slice a4(op[1:0],i0[4],i1[4],t[3],o[4],t[4]);
	alu_slice a5(op[1:0],i0[5],i1[5],t[4],o[5],t[5]);
	alu_slice a6(op[1:0],i0[6],i1[6],t[5],o[6],t[6]);
	alu_slice a7(op[1:0],i0[7],i1[7],t[6],o[7],t[7]);
	alu_slice a8(op[1:0],i0[8],i1[8],t[7],o[8],t[8]);
	alu_slice a9(op[1:0],i0[9],i1[9],t[8],o[9],t[9]);
	alu_slice a10(op[1:0],i0[10],i1[10],t[9],o[10],t[10]);
	alu_slice a11(op[1:0],i0[11],i1[11],t[10],o[11],t[11]);
	alu_slice a12(op[1:0],i0[12],i1[12],t[11],o[12],t[12]);
	alu_slice a13(op[1:0],i0[13],i1[13],t[12],o[13],t[13]);
	alu_slice a14(op[1:0],i0[14],i1[14],t[13],o[14],t[14]);
	alu_slice a15(op[1:0],i0[15],i1[15],t[14],o[15],cout);
endmodule
	

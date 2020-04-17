// Write code for modules you need here

module alu (input wire [1:0] op, input wire [15:0] i0, i1,
    output wire [15:0] o, output wire cout);
	
	wire c[14:0];
	alu_slice a0(op,i0[0],i1[0],op[0],o[0],c[0]);
	alu_slice a1(op,i0[1],i1[1],c[0],o[1],c[1]);
	alu_slice a2(op,i0[2],i1[2],c[1],o[2],c[2]);
	alu_slice a3(op,i0[3],i1[3],c[2],o[3],c[3]);
	alu_slice a4(op,i0[4],i1[4],c[3],o[4],c[4]);
	alu_slice a5(op,i0[5],i1[5],c[4],o[5],c[5]);
	alu_slice a6(op,i0[6],i1[6],c[5],o[6],c[6]);
	alu_slice a7(op,i0[7],i1[7],c[6],o[7],c[7]);
	alu_slice a8(op,i0[8],i1[8],c[7],o[8],c[8]);
	alu_slice a9(op,i0[9],i1[9],c[8],o[9],c[9]);
	alu_slice a10(op,i0[10],i1[10],c[9],o[10],c[10]);
	alu_slice a11(op,i0[11],i1[11],c[10],o[11],c[11]);
	alu_slice a12(op,i0[12],i1[12],c[11],o[12],c[12]);
	alu_slice a13(op,i0[13],i1[13],c[12],o[13],c[13]);
	alu_slice a14(op,i0[14],i1[14],c[13],o[14],c[14]);
	alu_slice a15(op,i0[15],i1[15],c[14],o[15],cout);
endmodule
// Declare wires here

// Instantiate modules here
module alu_slice(input wire [1:0] op,input wire i0,i1,cin,output wire o,carry);
	wire f1;
	fa16 b0(i0,i1,cin,f1,carry);
	wire t1,t2,t3;
	and2 b1(i0,i1,t1);
	or2 b2(i0,i1,t2);
	mux2 b3(t1,t2,op[0],t3);
	mux2 b4(t3,f1,op[1],o);

endmodule
module fa16(input wire i0,i1,cin,output wire o,carry);
	wire t4;
	xor2 c1(i1,cin,t4);
	fa c2(i0,t4,cin,o,carry);
endmodule
module fa(input wire a,b,c,output wire s,output wire coutput);
	wire t1;
	xor2 x1(a,b,t1);
	xor2 x2(t1,c,s);
	wire s1;
	and2 y1(a,b,s1);
	wire s2;
	and2 y2(b,c,s2);
	wire s3;
	and2 y3(a,c,s3);
	wire z1;
	or2 x3(s1,s2,z1);
	or2 x4(z1,s3,coutput);
	
endmodule


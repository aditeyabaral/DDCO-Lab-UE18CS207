//Module full adder.
module fulladd(input wire a,b,c, output wire s,cout);
	wire t0,t1,t2,t3,t4;
	xor2 x0(a,b,t0);
	xor2 x1(t0,c,s);
	and2 a0(a,b,t1);
	and2 a1(a,c,t2);
	and2 a2(b,c,t3);
	or2 o1(t1,t2,t4);
	or2 o2(t3,t4,cout);
endmodule

// Module 4-bit ripple carry adder.

module fa4 (input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
	wire[2:0] t;
	fulladd fa0(a[0],b[0],1'b0,sum[0],t[0]);
	fulladd fa1(a[1],b[1],t[0],sum[1],t[1]);
	fulladd fa2(a[2],b[2],t[1],sum[2],t[2]);
	fulladd fa3(a[3],b[3],t[2],sum[3],cout);
endmodule 


    

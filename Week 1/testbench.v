module testbench;
	wire o;
	reg i1,i2;
	test my_gate(.a(i1),.b(i2),.y1(o),.y2(o),.y3(o));
	initial begin $dumpfile("Test.vcd");
	$dumpvars(0,testbench);
	end
	initial begin
	i1=1'b0;
	i2=1'b0;
	#5
	i1=1'b0;
	i2=1'b1;
	#5
	i1=1'b1;
	i2=1'b0;
	#5
	i1=1'b1;
	i2=1'b1;
	#5
	i1=1'b0;
	i2=1'b0;
	end
endmodule

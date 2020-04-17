module test(a,b,y1,y2,y3);
input a;
input b;
output y1,y2,y3;
assign y1 = a|b;
assign y2 = a&b;
assign y3 = y1|y2;
endmodule

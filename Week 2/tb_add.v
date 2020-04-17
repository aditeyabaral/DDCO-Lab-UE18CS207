`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
  reg clk, reset;
  reg [3:0] i0, i1; reg cin;
  wire [3:0] o; wire cout;
  reg [8:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_add.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0] = 9'b000000010;
    test_vecs[1] = 9'b000100010;
    test_vecs[2] = 9'b011100010;
    test_vecs[3] = 9'b000001110;
    test_vecs[4] = 9'b011001111;
    test_vecs[5] = 9'b001110011;
    test_vecs[6] = 9'b111100011;
    test_vecs[7] = 9'b011101110;
  end
  initial {i0, i1, cin} = 0;
  fa4 u0 (i0, i1, cin, o, cout);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {i0, i1, cin}=test_vecs[i]; end
    #100 $finish;
  end
endmodule

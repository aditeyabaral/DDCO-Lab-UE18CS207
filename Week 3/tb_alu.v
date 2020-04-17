`timescale 1 ns / 100 ps
`define TESTVECS 16

module tb;
  reg clk, reset;
  reg [1:0] op; reg [15:0] i0, i1;
  wire [15:0] o; wire cout;
  reg [33:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_alu.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0][33:32] = 2'b00; test_vecs[0][31:16] = 16'h0000;test_vecs[0][15:0] = 16'h0000;
    test_vecs[1][33:32] = 2'b00; test_vecs[1][31:16] = 16'haa55;test_vecs[1][15:0] = 16'h55aa;
    test_vecs[2][33:32] = 2'b00; test_vecs[2][31:16] = 16'hffff;test_vecs[2][15:0] = 16'h0001;
    test_vecs[3][33:32] = 2'b00; test_vecs[3][31:16] = 16'h0001;test_vecs[3][15:0] = 16'h7fff;
    test_vecs[4][33:32] = 2'b01; test_vecs[4][31:16] = 16'h0000;test_vecs[4][15:0] = 16'h0000;
    test_vecs[5][33:32] = 2'b01; test_vecs[5][31:16] = 16'haa55;test_vecs[5][15:0] = 16'h55aa;
    test_vecs[6][33:32] = 2'b01; test_vecs[6][31:16] = 16'hffff;test_vecs[6][15:0] = 16'h0001;
    test_vecs[7][33:32] = 2'b01; test_vecs[7][31:16] = 16'h0001;test_vecs[7][15:0] = 16'h7fff;
    test_vecs[8][33:32] = 2'b10; test_vecs[8][31:16] = 16'h0000;test_vecs[8][15:0] = 16'h0000;
    test_vecs[9][33:32] = 2'b10; test_vecs[9][31:16] = 16'haa55;test_vecs[9][15:0] = 16'h55aa;
    test_vecs[10][33:32] = 2'b10; test_vecs[10][31:16] = 16'hffff;test_vecs[10][15:0] = 16'h0001;
    test_vecs[11][33:32] = 2'b10; test_vecs[11][31:16] = 16'h0001;test_vecs[11][15:0] = 16'h7fff;
    test_vecs[12][33:32] = 2'b11; test_vecs[12][31:16] = 16'h0000;test_vecs[12][15:0] = 16'h0000;
    test_vecs[13][33:32] = 2'b11; test_vecs[13][31:16] = 16'haa55;test_vecs[13][15:0] = 16'h55aa;
    test_vecs[14][33:32] = 2'b11; test_vecs[14][31:16] = 16'hffff;test_vecs[14][15:0] = 16'h0001;
    test_vecs[15][33:32] = 2'b11; test_vecs[15][31:16] = 16'h0001;test_vecs[15][15:0] = 16'h7fff;
  end
  initial {op, i0, i1} = 0;
  alu alu_0 (op, i0, i1, o, cout);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {op, i0, i1}=test_vecs[i]; end
    #100 $finish;
  end
endmodule

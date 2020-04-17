`timescale 1 ns / 100 ps
`define TESTVECS 6

module tb;
  reg clk, reset, wr;
  reg [2:0] rd_addr_a, rd_addr_b, wr_addr; reg [15:0] d_in;
  wire [15:0] d_out_a, d_out_b;
  reg [25:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_reg_file.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0][25] = 1'b1; test_vecs[0][24:22] = 3'ox; test_vecs[0][21:19] = 3'ox;
    test_vecs[0][18:16] = 3'h3; test_vecs[0][15:0] = 16'hcdef;
    test_vecs[1][25] = 1'b1; test_vecs[1][24:22] = 3'ox; test_vecs[1][21:19] = 3'ox;
    test_vecs[1][18:16] = 3'o7; test_vecs[1][15:0] = 16'h3210;
    test_vecs[2][25] = 1'b1; test_vecs[2][24:22] = 3'o3; test_vecs[2][21:19] = 3'o7;
    test_vecs[2][18:16] = 3'o5; test_vecs[2][15:0] = 16'h4567;
    test_vecs[3][25] = 1'b1; test_vecs[3][24:22] = 3'o1; test_vecs[3][21:19] = 3'o5;
    test_vecs[3][18:16] = 3'o0; test_vecs[3][15:0] = 16'hba98;
    test_vecs[4][25] = 1'b0; test_vecs[4][24:22] = 3'o1; test_vecs[4][21:19] = 3'o5;
    test_vecs[4][18:16] = 3'o1; test_vecs[4][15:0] = 16'hxxxx;
    test_vecs[5][25] = 1'b0; test_vecs[5][24:22] = 3'o0; test_vecs[5][21:19] = 3'o0;
    test_vecs[5][18:16] = 3'ox; test_vecs[5][15:0] = 16'hxxxx;
  end
  initial {wr, rd_addr_a, rd_addr_b, wr_addr, d_in} = 0;
  reg_file reg_file_0 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in, d_out_a, d_out_b);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {wr, rd_addr_a, rd_addr_b, wr_addr, d_in}=test_vecs[i]; end
    #100 $finish;
  end
endmodule

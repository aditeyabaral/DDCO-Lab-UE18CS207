`timescale 1 ns / 100 ps
`define TESTVECS 500

module tb;
  reg clk, reset;
  integer i;
  initial begin $dumpfile("tb_mproc_mem.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  mproc_mem mproc_mem_0 (clk, reset);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10; end
    #100 $finish;
  end
endmodule

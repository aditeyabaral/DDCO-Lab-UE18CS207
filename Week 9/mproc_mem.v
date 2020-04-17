module ram_128_16 (input wire clk, reset, wr, input wire [6:0] addr, input wire [15:0] din, output wire [15:0] dout);
  reg [0:127] ram [15:0];

  initial begin
    ram[0]=16'b10xxxxx000xxxxxx; // load r0, 1
    ram[1]=16'h01;
    ram[2]=16'b10xxxxx001xxxxxx; // load r1, 21
    ram[3]=16'h15;
    ram[4]=16'b10xxxxx010xxxxxx; // load r2, 1
    ram[5]=16'h01;
    ram[6]=16'b10xxxxx011xxxxxx; // load r3, 1
    ram[7]=16'h01;
    ram[8]=16'b0000000100010011; // add r4, r2, r3
    ram[9]=16'b0000010010011011; // move r2, r3 (and r2, r3, r3)
    ram[10]=16'b0000010011100100; // move r3, r4 (and r3, r4, r4)
    ram[11]=16'b0000001001000001; // sub r1, r0, r1
    ram[12]=16'b01xxxxxx00000101; // jbc ram[8]
    ram[13]=16'b0000010000100100; // move r0, r4 (and r0, r4, r4)
  end
  always @(wr) ram[addr]=din;
  assign dout=ram[addr];
endmodule

module mproc_mem (input wire clk, reset);
  wire wr; wire [6:0] addr; wire [15:0] d_in, d_out;

  ram_128_16 ram_128_16_0 (clk, reset, 1'b0, addr, d_out, d_in);
  mproc mproc_0 (clk, reset, d_in, addr, d_out);
endmodule

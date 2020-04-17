module ram_128_16 (input wire clk, reset, wr, input wire [6:0] addr, input wire [15:0] din, output wire [15:0] dout);
  reg [0:127] ram [15:0];

  initial begin
    ram[0]=16'o000100;
    ram[1]=16'o001201;
    ram[2]=16'o002321;
    ram[3]=16'o003432;
  end
  always @(wr) ram[addr]=din;
  assign dout=ram[addr];
endmodule

module mproc_mem (input wire clk, reset);
  wire [15:0] addr; wire [15:0] ins;

  ram_128_16 ram_128_16_0 (clk, reset, 1'b0, addr[6:0], 16'b0, ins);
  mproc mproc_0 (clk, reset, ins, addr);
endmodule

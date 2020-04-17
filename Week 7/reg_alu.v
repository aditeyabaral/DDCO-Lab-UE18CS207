module reg_file_2_1 (input wire clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in, output wire d_out_a, d_out_b);
  wire l0, l1, o0, o1;
  dfrl dfrl_0 (clk, reset, l0, d_in, o0);
  dfrl dfrl_1 (clk, reset, l1, d_in, o1);
  mux2 mux2_a (o0, o1, rd_addr_a, d_out_a);
  mux2 mux2_b (o0, o1, rd_addr_b, d_out_b);
  demux2 demux2_0 (wr, wr_addr, l0, l1);
endmodule

module _reg_file_2_1 (input wire clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in, output wire d_out_a, d_out_b);
  wire l0, l1, o0, o1;
  dfsl dfsl_0 (clk, reset, l0, d_in, o0);
  dfrl dfrl_1 (clk, reset, l1, d_in, o1);
  mux2 mux2_a (o0, o1, rd_addr_a, d_out_a);
  mux2 mux2_b (o0, o1, rd_addr_b, d_out_b);
  demux2 demux2_0 (wr, wr_addr, l0, l1);
endmodule

module _reg_file_4_1 (input wire clk, reset, wr, input wire [1:0] rd_addr_a, rd_addr_b, wr_addr, input wire d_in, output wire d_out_a, d_out_b);
  wire wr0, wr1, o0_a, o0_b, o1_a, o1_b;
  _reg_file_2_1 reg_file_2_1_0 (clk, reset, wr0, rd_addr_a[0], rd_addr_b[0], wr_addr[0],
  d_in, o0_a, o0_b);
  reg_file_2_1 reg_file_2_1_1 (clk, reset, wr1, rd_addr_a[0], rd_addr_b[0], wr_addr[0],
  d_in, o1_a, o1_b);
  mux2 mux2_a (o0_a, o1_a, rd_addr_a[1], d_out_a);
  mux2 mux2_b (o0_b, o1_b, rd_addr_b[1], d_out_b);
  demux2 demux2_0 (wr, wr_addr[1], wr0, wr1);
endmodule

module reg_file_4_1 (input wire clk, reset, wr, input wire [1:0] rd_addr_a, rd_addr_b, wr_addr, input wire d_in, output wire d_out_a, d_out_b);
  wire wr0, wr1, o0_a, o0_b, o1_a, o1_b;
  reg_file_2_1 reg_file_2_1_0 (clk, reset, wr0, rd_addr_a[0], rd_addr_b[0], wr_addr[0],
  d_in, o0_a, o0_b);
  reg_file_2_1 reg_file_2_1_1 (clk, reset, wr1, rd_addr_a[0], rd_addr_b[0], wr_addr[0],
  d_in, o1_a, o1_b);
  mux2 mux2_a (o0_a, o1_a, rd_addr_a[1], d_out_a);
  mux2 mux2_b (o0_b, o1_b, rd_addr_b[1], d_out_b);
  demux2 demux2_0 (wr, wr_addr[1], wr0, wr1);
endmodule

module reg_file_8_1 (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire d_in, output wire d_out_a, d_out_b);
  wire wr0, wr1, o0_a, o0_b, o1_a, o1_b;
  _reg_file_4_1 reg_file_4_1_0 (clk, reset, wr0, rd_addr_a[1:0], rd_addr_b[1:0], wr_addr[1:0],
  d_in, o0_a, o0_b);
  reg_file_4_1 reg_file_4_1_1 (clk, reset, wr1, rd_addr_a[1:0], rd_addr_b[1:0], wr_addr[1:0],
  d_in, o1_a, o1_b);
  mux2 mux2_a (o0_a, o1_a, rd_addr_a[2], d_out_a);
  mux2 mux2_b (o0_b, o1_b, rd_addr_b[2], d_out_b);
  demux2 demux2_0 (wr, wr_addr[2], wr0, wr1);
endmodule

module reg_file_8_4 (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [3:0] d_in, output wire [3:0] d_out_a, d_out_b);
  reg_file_8_1 reg_file_8_1_0 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[0], d_out_a[0], d_out_b[0]);
  reg_file_8_1 reg_file_8_1_1 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[1], d_out_a[1], d_out_b[1]);
  reg_file_8_1 reg_file_8_1_2 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[2], d_out_a[2], d_out_b[2]);
  reg_file_8_1 reg_file_8_1_3 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[3], d_out_a[3], d_out_b[3]);
endmodule

module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);
  reg_file_8_4 reg_file_8_4_0 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[3:0], d_out_a[3:0], d_out_b[3:0]);
  reg_file_8_4 reg_file_8_4_1 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[7:4], d_out_a[7:4], d_out_b[7:4]);
  reg_file_8_4 reg_file_8_4_2 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[11:8], d_out_a[11:8], d_out_b[11:8]);
  reg_file_8_4 reg_file_8_4_3 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr,
  d_in[15:12], d_out_a[15:12], d_out_b[15:12]);
endmodule

module mux2_4 (input wire [3:0] i0, i1, input wire j, output wire [3:0] o);
  mux2 mux2_0 (i0[0], i1[0], j, o[0]);
  mux2 mux2_1 (i0[1], i1[1], j, o[1]);
  mux2 mux2_2 (i0[2], i1[2], j, o[2]);
  mux2 mux2_3 (i0[3], i1[3], j, o[3]);
endmodule

module mux2_16 (input wire [15:0] i0, i1, input wire j, output wire [15:0] o);
  mux2_4 mux2_4_0 (i0[3:0], i1[3:0], j, o[3:0]);
  mux2_4 mux2_4_1 (i0[7:4], i1[7:4], j, o[7:4]);
  mux2_4 mux2_4_2 (i0[11:8], i1[11:8], j, o[11:8]);
  mux2_4 mux2_4_3 (i0[15:12], i1[15:12], j, o[15:12]);
endmodule

module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a,
  rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);
  wire [15:0] d_in_alu, d_in_reg; wire cout_0;
  alu alu_0 (op, d_out_a, d_out_b, d_in_alu, cout_0);
  reg_file reg_file_0 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in_reg, d_out_a, d_out_b);
  mux2_16 mux2_16_0 (d_in, d_in_alu, sel, d_in_reg);
  dfr dfr_0 (clk, reset, cout_0, cout);
endmodule

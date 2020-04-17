module pc_slice (input wire clk, reset, cin, load, inc, sub, offset,
  output wire cout, pc);
  wire in, inc_;
  invert invert_0 (inc, inc_);
  and2 and2_0 (offset, inc_, t);
  addsub addsub_0 (sub, pc, t, cin, in, cout);
  dfrl dfrl_0 (clk, reset, load, in, pc);
endmodule

module pc_slice0 (input wire clk, reset, cin, load, inc, sub, offset,
  output wire cout, pc);
  wire in;
  or2 or2_0 (offset, inc, t);
  addsub addsub_0 (sub, pc, t, cin, in, cout);
  dfrl dfrl_0 (clk, reset, load, in, pc);
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset,
  output wire [15:0] pc);
  input wire load; input wire [15:0] c;
  or3 or3_0 (inc, add, sub, load);
  pc_slice0 pc_slice_0 (clk, reset, sub, load, inc, sub, offset[0], c[0], pc[0]);
  pc_slice pc_slice_1 (clk, reset, c[0], load, inc, sub, offset[1], c[1], pc[1]);
  pc_slice pc_slice_2 (clk, reset, c[1], load, inc, sub, offset[2], c[2], pc[2]);
  pc_slice pc_slice_3 (clk, reset, c[2], load, inc, sub, offset[3], c[3], pc[3]);
  pc_slice pc_slice_4 (clk, reset, c[3], load, inc, sub, offset[4], c[4], pc[4]);
  pc_slice pc_slice_5 (clk, reset, c[4], load, inc, sub, offset[5], c[5], pc[5]);
  pc_slice pc_slice_6 (clk, reset, c[5], load, inc, sub, offset[6], c[6], pc[6]);
  pc_slice pc_slice_7 (clk, reset, c[6], load, inc, sub, offset[7], c[7], pc[7]);
  pc_slice pc_slice_8 (clk, reset, c[7], load, inc, sub, offset[8], c[8], pc[8]);
  pc_slice pc_slice_9 (clk, reset, c[8], load, inc, sub, offset[9], c[9], pc[9]);
  pc_slice pc_slice_10 (clk, reset, c[9], load, inc, sub, offset[10], c[10], pc[10]);
  pc_slice pc_slice_11 (clk, reset, c[10], load, inc, sub, offset[11], c[11], pc[11]);
  pc_slice pc_slice_12 (clk, reset, c[11], load, inc, sub, offset[12], c[12], pc[12]);
  pc_slice pc_slice_13 (clk, reset, c[12], load, inc, sub, offset[13], c[13], pc[13]);
  pc_slice pc_slice_14 (clk, reset, c[13], load, inc, sub, offset[14], c[14], pc[14]);
  pc_slice pc_slice_15 (clk, reset, c[14], load, inc, sub, offset[15], c[15], pc[15]);
endmodule

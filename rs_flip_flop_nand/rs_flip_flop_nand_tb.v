`timescale 1ns / 1ns
`include "rs_flip_flop_nand.v"

module rs_flip_flop_nand_tb;
  reg  ns;
  reg  nr;
  wire q;
  wire nq;

  rs_flip_flop_nand uut (
      .ns(ns),
      .nr(nr),
      .q (q),
      .nq(nq)
  );

  initial begin
    $dumpfile("rs_flip_flop_nand_tb.vcd");
    $dumpvars(0, rs_flip_flop_nand_tb);

    ns = 0;
    nr = 0;

    #10 ns = 0;
    nr = 1;

    #10 ns = 1;
    nr = 0;

    #10 ns = 1;
    nr = 1;

    #10 ns = 0;
    nr = 0;

    #10 ns = 0;
    nr = 0;
  end
endmodule

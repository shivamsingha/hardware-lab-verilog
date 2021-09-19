`timescale 1ns / 1ns
`include "full_adder.v"

module full_adder_tb;
  reg  a;
  reg  b;
  reg  c_in;
  wire s;
  wire c_out;

  full_adder uut (
      a,
      b,
      c_in,
      s,
      c_out
  );

  initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0, full_adder_tb);

    a = 0;
    b = 0;
    c_in = 0;
    #20;

    a = 0;
    b = 0;
    c_in = 1;
    #20;

    a = 0;
    b = 1;
    c_in = 0;
    #20;

    a = 0;
    b = 1;
    c_in = 1;
    #20 a = 1;
    b = 0;
    c_in = 0;
    #20;

    a = 1;
    b = 0;
    c_in = 1;
    #20;

    a = 1;
    b = 1;
    c_in = 0;
    #20;

    a = 1;
    b = 1;
    c_in = 1;
    #20;
  end
endmodule

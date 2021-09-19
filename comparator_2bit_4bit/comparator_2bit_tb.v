`timescale 1ns / 1ns
`include "comparator_2bit.v"

module comparator_2bit_tb;
  reg [1:0] a;
  reg [1:0] b;
  wire g;
  wire e;
  wire l;

  comparator_2bit uut (
      .a(a),
      .b(b),
      .g(g),
      .e(e),
      .l(l)
  );

  initial begin
    $dumpfile("comparator_2bit_tb.vcd");
    $dumpvars(0, comparator_2bit_tb);

    a = 2'b00;
    b = 2'b00;

    #10 a = 2'b01;
    b = 2'b00;

    #10 a = 2'b00;
    b = 2'b01;

    #10 a = 2'b11;
    b = 2'b10;

    #10 a = 2'b10;
    b = 2'b11;

    #10 a = 2'b11;
    b = 2'b11;
  end
endmodule

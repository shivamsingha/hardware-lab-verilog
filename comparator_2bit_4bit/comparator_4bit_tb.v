`timescale 1ns / 1ns
`include "comparator_4bit.v"

module comparator_4bit_tb;
  reg [3:0] a;
  reg [3:0] b;
  wire g;
  wire e;
  wire l;

  comparator_4bit uut (
      .a(a),
      .b(b),
      .g(g),
      .e(e),
      .l(l)
  );

  initial begin
    $dumpfile("comparator_4bit_tb.vcd");
    $dumpvars(0, comparator_4bit_tb);

    a = 4'b0000;
    b = 4'b0000;

    #10 a = 4'b0001;
    b = 4'b0000;

    #10 a = 4'b1000;
    b = 4'b0101;

    #10 a = 4'b0111;
    b = 4'b0111;

    #10 a = 4'b0111;
    b = 4'b1011;

    #10 a = 4'b0110;
    b = 4'b1111;

    #10 a = 4'b1111;
    b = 4'b1111;
  end
endmodule

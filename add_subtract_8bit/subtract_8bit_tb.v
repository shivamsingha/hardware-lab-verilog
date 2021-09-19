`timescale 1ns / 1ns
`include "subtract_8bit.v"

module subtract_8bit_tb;
  reg [7:0] a;
  reg [7:0] b;
  reg b_in;
  wire [7:0] d;
  wire b_out;

  subtract_8bit uut (
      .a(a),
      .b(b),
      .b_in(b_in),
      .d(d),
      .b_out(b_out)
  );

  initial begin
    $dumpfile("subtract_8bit_tb.vcd");
    $dumpvars(0, subtract_8bit_tb);

    a = 8'b00000001;
    b = 8'b00000001;
    b_in = 1'b0;

    #10 a = 8'b00000011;
    b = 8'b00000101;
    b_in = 1'b1;

    #10 a = 8'b00000001;
    b = 8'b00000001;
    b_in = 1'b1;

    #10 a = 8'b00000010;
    b = 8'b00000011;
    b_in = 1'b0;

    #10 a = 8'b10000001;
    b = 8'b10000001;
    b_in = 1'b0;

    #10 a = 8'b00011001;
    b = 8'b00110001;
    b_in = 1'b0;

    #10 a = 8'b00110001;
    b = 8'b00011001;
    b_in = 1'b0;

    #10 a = 8'b00000011;
    b = 8'b00000011;
    b_in = 1'b1;

    #10 a = 8'b11111111;
    b = 8'b00000001;
    b_in = 1'b0;

    #10 a = 8'b11111111;
    b = 8'b00000000;
    b_in = 1'b1;

    #10 a = 8'b11111111;
    b = 8'b11111111;
    b_in = 1'b0;
  end
endmodule

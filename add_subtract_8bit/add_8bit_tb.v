`timescale 1ns / 1ns
`include "add_8bit.v"

module add_8bit_tb;
  reg [7:0] a;
  reg [7:0] b;
  reg c_in;
  wire [7:0] s;
  wire c_out;

  add_8bit uut (
      .a(a),
      .b(b),
      .c_in(c_in),
      .s(s),
      .c_out(c_out)
  );

  initial begin
    $dumpfile("add_8bit_tb.vcd");
    $dumpvars(0, add_8bit_tb);

    a = 8'b00000001;
    b = 8'b00000001;
    c_in = 1'b0;

    #10 a = 8'b00000011;
    b = 8'b00000101;
    c_in = 1'b1;

    #10 a = 8'b00000001;
    b = 8'b00000001;
    c_in = 1'b1;

    #10 a = 8'b00000010;
    b = 8'b00000011;
    c_in = 1'b0;

    #10 a = 8'b10000001;
    b = 8'b10000001;
    c_in = 1'b0;

    #10 a = 8'b00011001;
    b = 8'b00110001;
    c_in = 1'b0;

    #10 a = 8'b00110001;
    b = 8'b00011001;
    c_in = 1'b0;

    #10 a = 8'b00000011;
    b = 8'b00000011;
    c_in = 1'b1;

    #10 a = 8'b11111111;
    b = 8'b00000001;
    c_in = 1'b0;

    #10 a = 8'b11111111;
    b = 8'b00000000;
    c_in = 1'b1;

    #10 a = 8'b11111111;
    b = 8'b11111111;
    c_in = 1'b0;
  end
endmodule

module full_adder (
    a,
    b,
    c_in,
    s,
    c_out
);
  input a;
  input b;
  input c_in;
  output s;
  output c_out;

  assign a_xor_b = a ^ b;
  assign s = a_xor_b ^ c_in;
  assign c_out = (c_in & a_xor_b) | (a & b);
endmodule

module add_8bit (
    a,
    b,
    c_in,
    s,
    c_out
);
  input [7:0] a;
  input [7:0] b;
  input c_in;
  output [7:0] s;
  output c_out;

  wire [6:0] c;

  full_adder fa0 (
      .a(a[0]),
      .b(b[0]),
      .c_in(c_in),
      .s(s[0]),
      .c_out(c[0])
  );

  full_adder fa1 (
      .a(a[1]),
      .b(b[1]),
      .c_in(c[0]),
      .s(s[1]),
      .c_out(c[1])
  );

  full_adder fa2 (
      .a(a[2]),
      .b(b[2]),
      .c_in(c[1]),
      .s(s[2]),
      .c_out(c[2])
  );

  full_adder fa3 (
      .a(a[3]),
      .b(b[3]),
      .c_in(c[2]),
      .s(s[3]),
      .c_out(c[3])
  );

  full_adder fa4 (
      .a(a[4]),
      .b(b[4]),
      .c_in(c[3]),
      .s(s[4]),
      .c_out(c[4])
  );

  full_adder fa5 (
      .a(a[5]),
      .b(b[5]),
      .c_in(c[4]),
      .s(s[5]),
      .c_out(c[5])
  );

  full_adder fa6 (
      .a(a[6]),
      .b(b[6]),
      .c_in(c[5]),
      .s(s[6]),
      .c_out(c[6])
  );

  full_adder fa7 (
      .a(a[7]),
      .b(b[7]),
      .c_in(c[6]),
      .s(s[7]),
      .c_out(c_out)
  );

endmodule

module subtract_8bit (a, b, b_in, d, b_out);
  input [7:0] a;
  input [7:0] b;
  input b_in;
  output [7:0] d;
  output b_out;
  wire [7:0] twos_comp;
  wire c_out;

  add_8bit rca0(.a(~b), .b(8'b00000001), .c_in(1'b0), .s(twos_comp), .c_out(c_out));
  add_8bit rca1(.a(a), .b(twos_comp), .c_in(b_in), .s(d), .c_out(b_out));
endmodule
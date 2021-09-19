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

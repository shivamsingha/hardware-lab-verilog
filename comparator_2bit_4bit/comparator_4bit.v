`include "comparator_2bit.v"

module comparator_4bit (
    a,
    b,
    g,
    e,
    l
);
  input [3:0] a;
  input [3:0] b;
  output g;
  output e;
  output l;

  wire [3:0] i;
  wire [1:0] j1;
  wire [1:0] j2;
  wire [1:0] k1;
  wire [1:0] k2;

  comparator_2bit com0 (
      .a(a[1:0]),
      .b(b[1:0]),
      .g(i[0]),
      .e(e),
      .l(i[1])
  );

  assign j1 = {a[2], i[0]};
  assign j2 = {b[2], i[1]};

  comparator_2bit com1 (
      .a(j1),
      .b(j2),
      .g(i[2]),
      .e(e),
      .l(i[3])
  );

  assign k1 = {a[3], i[2]};
  assign k2 = {b[3], i[3]};

  comparator_2bit com (
      .a(k1),
      .b(k2),
      .g(g),
      .e(e),
      .l(l)
  );
endmodule

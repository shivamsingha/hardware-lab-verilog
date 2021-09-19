module comparator_2bit (
    a,
    b,
    g,
    e,
    l
);
  input [1:0] a;
  input [1:0] b;
  output g;
  output e;
  output l;

  wire [1:0] not_a;
  wire [1:0] not_b;
  wire [1:0] x;
  wire [1:0] y;
  wire [1:0] z;
  wire i;
  wire j;

  not (not_a[0], a[0]);
  not (not_a[1], a[1]);
  not (not_b[0], b[0]);
  not (not_b[1], b[1]);

  and (x[0], a[0], not_b[0]);
  nand (x[1], a[1], not_b[1]);

  xnor (y[0], a[0], b[0]);
  xnor (y[1], a[1], b[1]);

  nand (i, x[0], y[1]);

  and (z[0], not_a[0], b[0]);
  nand (z[1], not_a[1], b[1]);

  nand (j, z[0], y[1]);

  nand (g, i, x[1]);
  nand (l, j, z[1]);
  and (e, y[0], y[1]);
endmodule

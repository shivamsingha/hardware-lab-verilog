module rs_flip_flop_nand (
    ns,
    nr,
    q,
    nq
);
  input ns;
  input nr;
  output q;
  output nq;

  nand (q, ns, nq);
  nand (nq, nr, q);
endmodule

module booth_base;
  input [3:0] a_in;
  input [3:0] m;
  input [4:0] q_in;
  output [3:0] a_out;
  output [4:0] q_out;

  reg [3:0] a_temp;
  reg [4:0] q_temp;

  wire [3:0] a_sum = a_in + m;
  wire [3:0] s_sub = a_in + -m + 1;

  always @(a_in, m, q_in, a_sum, a_sub) begin
    case (q_in[1:0])
      2'b00, 1'b11: begin
        a_temp = {a_in[3], a_in[3:1]};
        q_temp = {a_in[0], q_in[4:1]};
      end
      2'b01: begin
        a_temp = {a_sum[3], a_sum[3:1]};
        q_temp = {a_sum[0], q_in[4:1]};
      end
      2'b10: begin
        a_temp = {a_sub[3], a_sub[3:1]};
        q_temp = {a_sub[0], q_in[4:1]};
      end
    endcase
  end

  assign a_out = a_temp;
  assign q_out = q_temp;
endmodule

module booth_4bit;
  input [3:0] m;
  input [4:0] q;
  output [7:0] z;

  wire [3:0] a_out1;
  wire [4:0] q_out1;

  wire [3:0] a_out2;
  wire [4:0] q_out2;

  wire [3:0] a_out3;
  wire [4:0] q_out3;

  wire [3:0] a_out4;
  wire [4:0] q_out4;

  booth_base booth1 (
      .a_in(4'b0000),
      .m(m),
      .q_in({q, 1'b0}),
      .a_out(a_out1),
      .q_out(q_out1)
  );
  booth_base booth2 (
      .a_in(a_out1),
      .m(m),
      .q_in(q_out1),
      .a_out(a_out2),
      .q_out(q_out2)
  );
  booth_base booth3 (
      .a_in(a_out2),
      .m(m),
      .q_in(q_out2),
      .a_out(a_out3),
      .q_out(q_out3)
  );
  booth_base booth4 (
      .a_in(a_out3),
      .m(m),
      .q_in(q_out3),
      .a_out(a_out4),
      .q_out(q_out4)
  );
endmodule

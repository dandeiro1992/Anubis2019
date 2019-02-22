`timescale 1ns / 1ps

module Sbox (
    input  wire[7 : 0] data_in,
    output wire[7 : 0] data_out
);

wire [7:0] after_1;
wire [7:0] after_2;

P p1 (.data_in(data_in[7:4]),.data_out(after_1[7:4]));
Q q1 (.data_in(data_in[3:0]),.data_out(after_1[3:0]));

P p2 (.data_in({after_1[5:4],after_1[1:0]}),.data_out(after_2[3:0]));
Q q2 (.data_in({after_1[7:6],after_1[3:2]}),.data_out(after_2[7:4]));

P p3 (.data_in({after_2[7:6],after_2[3:2]}),.data_out(data_out[7:4]));
Q q3 (.data_in({after_2[5:4],after_2[1:0]}),.data_out(data_out[3:0]));

endmodule

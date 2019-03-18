`timescale 1ns / 1ps

module X (
    input  wire [3 : 0] data_in,
    output wire [1 : 0] data_out
);
wire out_1,out_2,out_3,xor_block_1,xor_block_2;
assign out_1=data_in[3]&data_in[1];
assign xor_block_1=data_in[3]^data_in[2];
assign xor_block_2=data_in[1]^data_in[0];
assign out_2=xor_block_1&xor_block_2;
assign out_3=data_in[2]&data_in[0];
assign data_out[1]=out_2^out_3;
assign data_out[0]=out_1^out_3;

endmodule
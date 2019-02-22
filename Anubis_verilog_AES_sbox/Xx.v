`timescale 1ns / 1ps

module XX (
    input  wire [7 : 0] data_in,
    output wire [3 : 0] data_out
);
wire [1:0] out_11,out_22,out_33,xor_block_1,xor_block_2,xfii,xor_block_3,xor_block_4;

X out_1(.data_in({data_in[7:6],data_in[3:2]}),.data_out(out_11));
assign xor_block_1=data_in[7:6]^data_in[5:4];
assign xor_block_2=data_in[3:2]^data_in[1:0];
X out_2(.data_in({xor_block_1,xor_block_2}),.data_out(out_22));
X out_3(.data_in({data_in[5:4],data_in[1:0]}),.data_out(out_33));
XFI xfi(.data_in(out_11),.data_out(xfii));
assign data_out[3:2]=out_22^out_33;
assign data_out[1:0]=xfii^out_33;
endmodule
`timescale 1ns / 1ps

module XLAMBDA (
    input  wire [3 : 0] data_in,
    output wire [3 : 0] data_out
);

assign data_out[3]=data_in[2]^data_in[0];
assign data_out[2]=(data_in[3]^data_in[1])^(data_in[2]^data_in[0]);
assign data_out[1]=data_in[3];
assign data_out[0]=data_in[2];

endmodule
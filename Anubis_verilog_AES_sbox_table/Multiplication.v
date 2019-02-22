`timescale 1ns / 1ps

module Multiplication (
    input  wire[31 : 0] data_in,
    output wire[31 : 0] data_out
);
 

wire [7:0] byte_0 = data_in[31 : 24];
wire [7:0] byte_1 = data_in[23 : 16];
wire [7:0] byte_2 = data_in[15 : 8];
wire [7:0] byte_3 = data_in[7 :0];

wire [7:0] factor_0_0;
wire [7:0] factor_0_1;
wire [7:0] factor_0_2_1;
wire [7:0] factor_0_2;
wire [7:0] factor_0_3_1;
wire [7:0] factor_0_3_2;
wire [7:0] factor_0_3;

assign factor_0_0=byte_0;
assign factor_0_1=(byte_1[7]==1'b0)?{byte_1[6:0],1'b0}:({byte_1[6:0],1'b0}^8'h1d);
assign factor_0_2_1=(byte_2[7]==1'b0)?{byte_2[6:0],1'b0}:({byte_2[6:0],1'b0}^8'h1d);
assign factor_0_2=(factor_0_2_1[7]==1'b0)?{factor_0_2_1[6:0],1'b0}:({factor_0_2_1[6:0],1'b0}^8'h1d);
assign factor_0_3_1=(byte_3[7]==1'b0)?{byte_3[6:0],1'b0}:({byte_3[6:0],1'b0}^8'h1d);
assign factor_0_3_2=factor_0_3_1^byte_3;
assign factor_0_3=(factor_0_3_2[7]==1'b0)?{factor_0_3_2[6:0],1'b0}:({factor_0_3_2[6:0],1'b0}^8'h1d);

wire [7:0] factor_1_0;
wire [7:0] factor_1_1;
wire [7:0] factor_1_2_1;
wire [7:0] factor_1_2_2;
wire [7:0] factor_1_2;
wire [7:0] factor_1_3_1;
wire [7:0] factor_1_3;

assign factor_1_0=(byte_0[7]==1'b0)?{byte_0[6:0],1'b0}:({byte_0[6:0],1'b0}^8'h1d);
assign factor_1_1=byte_1;
assign factor_1_2_1=(byte_2[7]==1'b0)?{byte_2[6:0],1'b0}:({byte_2[6:0],1'b0}^8'h1d);
assign factor_1_2_2=factor_1_2_1^byte_2;
assign factor_1_2=(factor_1_2_2[7]==1'b0)?{factor_1_2_2[6:0],1'b0}:({factor_1_2_2[6:0],1'b0}^8'h1d);
assign factor_1_3_1=(byte_3[7]==1'b0)?{byte_3[6:0],1'b0}:({byte_3[6:0],1'b0}^8'h1d);
assign factor_1_3=(factor_1_3_1[7]==1'b0)?{factor_1_3_1[6:0],1'b0}:({factor_1_3_1[6:0],1'b0}^8'h1d);

wire [7:0] factor_2_0_1;
wire [7:0] factor_2_0;
wire [7:0] factor_2_1_1;
wire [7:0] factor_2_1_2;
wire [7:0] factor_2_1;
wire [7:0] factor_2_2;
wire [7:0] factor_2_3;

assign factor_2_0_1=(byte_0[7]==1'b0)?{byte_0[6:0],1'b0}:({byte_0[6:0],1'b0}^8'h1d);
assign factor_2_0=(factor_2_0_1[7]==1'b0)?{factor_2_0_1[6:0],1'b0}:({factor_2_0_1[6:0],1'b0}^8'h1d);

assign factor_2_1_1=(byte_1[7]==1'b0)?{byte_1[6:0],1'b0}:({byte_1[6:0],1'b0}^8'h1d);
assign factor_2_1_2=factor_2_1_1^byte_1;
assign factor_2_1=(factor_2_1_2[7]==1'b0)?{factor_2_1_2[6:0],1'b0}:({factor_2_1_2[6:0],1'b0}^8'h1d);

assign factor_2_2=byte_2;

assign factor_2_3=(byte_3[7]==1'b0)?{byte_3[6:0],1'b0}:({byte_3[6:0],1'b0}^8'h1d);

wire [7:0] factor_3_0_1;
wire [7:0] factor_3_0_2;
wire [7:0] factor_3_0;
wire [7:0] factor_3_1_1;
wire [7:0] factor_3_1;
wire [7:0] factor_3_2;
wire [7:0] factor_3_3;

assign factor_3_0_1=(byte_0[7]==1'b0)?{byte_0[6:0],1'b0}:({byte_0[6:0],1'b0}^8'h1d);
assign factor_3_0_2=factor_3_0_1^byte_0;
assign factor_3_0=(factor_3_0_2[7]==1'b0)?{factor_3_0_2[6:0],1'b0}:({factor_3_0_2[6:0],1'b0}^8'h1d);

assign factor_3_1_1=(byte_1[7]==1'b0)?{byte_1[6:0],1'b0}:({byte_1[6:0],1'b0}^8'h1d);
assign factor_3_1=(factor_3_1_1[7]==1'b0)?{factor_3_1_1[6:0],1'b0}:({factor_3_1_1[6:0],1'b0}^8'h1d);

assign factor_3_2=(byte_2[7]==1'b0)?{byte_2[6:0],1'b0}:({byte_2[6:0],1'b0}^8'h1d);

assign factor_3_3=byte_3;

assign data_out={factor_0_0^factor_0_1^factor_0_2^factor_0_3,factor_1_0^factor_1_1^factor_1_2^factor_1_3,factor_2_0^factor_2_1^factor_2_2^factor_2_3,factor_3_0^factor_3_1^factor_3_2^factor_3_3};

endmodule
`timescale 1ns / 1ps

module Omega (
    input  wire [127 : 0] data_in,
    output wire [127 : 0] data_out
);

wire [7:0] byte_0_0= data_in[127:120];
wire [7:0] byte_0_1= data_in[119:112];
wire [7:0] byte_0_2= data_in[111:104];
wire [7:0] byte_0_3= data_in[103:96];
wire [7:0] byte_1_0= data_in[95:88];
wire [7:0] byte_1_1= data_in[87:80];
wire [7:0] byte_1_2= data_in[79:72];
wire [7:0] byte_1_3= data_in[71:64];
wire [7:0] byte_2_0= data_in[63:56];
wire [7:0] byte_2_1= data_in[55:48];
wire [7:0] byte_2_2= data_in[47:40];
wire [7:0] byte_2_3= data_in[39:32];
wire [7:0] byte_3_0= data_in[31:24];
wire [7:0] byte_3_1= data_in[23:16];
wire [7:0] byte_3_2= data_in[15:8];
wire [7:0] byte_3_3= data_in[7:0];

wire [7:0] factor_0_0_0;
wire [7:0] factor_0_0_1;
wire [7:0] factor_0_0_2;
wire [7:0] factor_0_0_3;
wire [7:0] factor_0_1_0;
wire [7:0] factor_0_1_1;
wire [7:0] factor_0_1_2;
wire [7:0] factor_0_1_3;
wire [7:0] factor_0_2_0;
wire [7:0] factor_0_2_1;
wire [7:0] factor_0_2_2;
wire [7:0] factor_0_2_3;
wire [7:0] factor_0_3_0;
wire [7:0] factor_0_3_1;
wire [7:0] factor_0_3_2;
wire [7:0] factor_0_3_3;
wire [7:0] factor_1_0_0;
wire [7:0] factor_1_0_1;
wire [7:0] factor_1_0_2;
wire [7:0] factor_1_0_3;
wire [7:0] factor_1_1_0;
wire [7:0] factor_1_1_1;
wire [7:0] factor_1_1_2;
wire [7:0] factor_1_1_3;
wire [7:0] factor_1_2_0;
wire [7:0] factor_1_2_1;
wire [7:0] factor_1_2_2;
wire [7:0] factor_1_2_3;
wire [7:0] factor_1_3_0;
wire [7:0] factor_1_3_1;
wire [7:0] factor_1_3_2;
wire [7:0] factor_1_3_3;
wire [7:0] factor_2_0_0;
wire [7:0] factor_2_0_1;
wire [7:0] factor_2_0_2;
wire [7:0] factor_2_0_3;
wire [7:0] factor_2_1_0;
wire [7:0] factor_2_1_1;
wire [7:0] factor_2_1_2;
wire [7:0] factor_2_1_3;
wire [7:0] factor_2_2_0;
wire [7:0] factor_2_2_1;
wire [7:0] factor_2_2_2;
wire [7:0] factor_2_2_3;
wire [7:0] factor_2_3_0;
wire [7:0] factor_2_3_1;
wire [7:0] factor_2_3_2;
wire [7:0] factor_2_3_3;
wire [7:0] factor_3_0_0;
wire [7:0] factor_3_0_1;
wire [7:0] factor_3_0_2;
wire [7:0] factor_3_0_3;
wire [7:0] factor_3_1_0;
wire [7:0] factor_3_1_1;
wire [7:0] factor_3_1_2;
wire [7:0] factor_3_1_3;
wire [7:0] factor_3_2_0;
wire [7:0] factor_3_2_1;
wire [7:0] factor_3_2_2;
wire [7:0] factor_3_2_3;
wire [7:0] factor_3_3_0;
wire [7:0] factor_3_3_1;
wire [7:0] factor_3_3_2;
wire [7:0] factor_3_3_3;

//dodatkowe
wire [7:0] factor_1_0_2_1;
wire [7:0] factor_1_0_3_1;
wire [7:0] factor_1_0_3_2;
// nie wiem czy potrzebne

wire [7:0] factor_0_0;
wire [7:0] factor_0_1;
wire [7:0] factor_0_2;
wire [7:0] factor_0_3;
wire [7:0] factor_1_0;
wire [7:0] factor_1_1;
wire [7:0] factor_1_2;
wire [7:0] factor_1_3;
wire [7:0] factor_2_0;
wire [7:0] factor_2_1;
wire [7:0] factor_2_2;
wire [7:0] factor_2_3;
wire [7:0] factor_3_0;
wire [7:0] factor_3_1;
wire [7:0] factor_3_2;
wire [7:0] factor_3_3;

//liczę elementy 1 wiersza
assign data_out[127:120]=byte_0_0^byte_1_0^byte_2_0^byte_3_0;
assign data_out[119:112]=byte_0_1^byte_1_1^byte_2_1^byte_3_1;
assign data_out[111:104]=byte_0_2^byte_1_2^byte_2_2^byte_3_2;
assign data_out[103:96]=byte_0_3^byte_1_3^byte_2_3^byte_3_3;

// liczę wiersz drugi

assign factor_1_0_0=byte_0_0;
assign factor_1_0_1=(byte_1_0[7]==1'b0)?{byte_1_0[6:0],1'b0}:({byte_1_0[6:0],1'b0}^8'h1d);
assign factor_1_0_2_1=(byte_2_0[7]==1'b0)?{byte_2_0[6:0],1'b0}:({byte_2_0[6:0],1'b0}^8'h1d);
assign factor_1_0_2=(factor_1_0_2_1[7]==1'b0)?{factor_1_0_2_1[6:0],1'b0}:({factor_1_0_2_1[6:0],1'b0}^8'h1d);
assign factor_1_0_3_1=(byte_3_0[7]==1'b0)?{byte_3_0[6:0],1'b0}:({byte_3_0[6:0],1'b0}^8'h1d);
assign factor_1_0_3_2=(factor_1_0_3_1[7]==1'b0)?{factor_1_0_3_1[6:0],1'b0}:({factor_1_0_3_1[6:0],1'b0}^8'h1d);
assign factor_1_0_3=(factor_1_0_3_2[7]==1'b0)?{factor_1_0_3_2[6:0],1'b0}:({factor_1_0_3_2[6:0],1'b0}^8'h1d);
assign data_out[95:88]=factor_1_0_0^factor_1_0_1^factor_1_0_2^factor_1_0_3;


//dodatkowe
wire [7:0] factor_1_1_2_1;
wire [7:0] factor_1_1_3_1;
wire [7:0] factor_1_1_3_2;

assign factor_1_1_0=byte_0_1;
assign factor_1_1_1=(byte_1_1[7]==1'b0)?{byte_1_1[6:0],1'b0}:({byte_1_1[6:0],1'b0}^8'h1d);
assign factor_1_1_2_1=(byte_2_1[7]==1'b0)?{byte_2_1[6:0],1'b0}:({byte_2_1[6:0],1'b0}^8'h1d);
assign factor_1_1_2=(factor_1_1_2_1[7]==1'b0)?{factor_1_1_2_1[6:0],1'b0}:({factor_1_1_2_1[6:0],1'b0}^8'h1d);
assign factor_1_1_3_1=(byte_3_1[7]==1'b0)?{byte_3_1[6:0],1'b0}:({byte_3_1[6:0],1'b0}^8'h1d);
assign factor_1_1_3_2=(factor_1_1_3_1[7]==1'b0)?{factor_1_1_3_1[6:0],1'b0}:({factor_1_1_3_1[6:0],1'b0}^8'h1d);
assign factor_1_1_3=(factor_1_1_3_2[7]==1'b0)?{factor_1_1_3_2[6:0],1'b0}:({factor_1_1_3_2[6:0],1'b0}^8'h1d);
assign data_out[87:80]=factor_1_1_0^factor_1_1_1^factor_1_1_2^factor_1_1_3;



//dodatkowe
wire [7:0] factor_1_2_2_1;
wire [7:0] factor_1_2_3_1;
wire [7:0] factor_1_2_3_2;

assign factor_1_2_0=byte_0_2;
assign factor_1_2_1=(byte_1_2[7]==1'b0)?{byte_1_2[6:0],1'b0}:({byte_1_2[6:0],1'b0}^8'h1d);
assign factor_1_2_2_1=(byte_2_2[7]==1'b0)?{byte_2_2[6:0],1'b0}:({byte_2_2[6:0],1'b0}^8'h1d);
assign factor_1_2_2=(factor_1_2_2_1[7]==1'b0)?{factor_1_2_2_1[6:0],1'b0}:({factor_1_2_2_1[6:0],1'b0}^8'h1d);
assign factor_1_2_3_1=(byte_3_2[7]==1'b0)?{byte_3_2[6:0],1'b0}:({byte_3_2[6:0],1'b0}^8'h1d);
assign factor_1_2_3_2=(factor_1_2_3_1[7]==1'b0)?{factor_1_2_3_1[6:0],1'b0}:({factor_1_2_3_1[6:0],1'b0}^8'h1d);
assign factor_1_2_3=(factor_1_2_3_2[7]==1'b0)?{factor_1_2_3_2[6:0],1'b0}:({factor_1_2_3_2[6:0],1'b0}^8'h1d);
assign data_out[79:72]=factor_1_2_0^factor_1_2_1^factor_1_2_2^factor_1_2_3;

//dodatkowe
wire [7:0] factor_1_3_2_1;
wire [7:0] factor_1_3_3_1;
wire [7:0] factor_1_3_3_2;

assign factor_1_3_0=byte_0_3;
assign factor_1_3_1=(byte_1_3[7]==1'b0)?{byte_1_3[6:0],1'b0}:({byte_1_3[6:0],1'b0}^8'h1d);
assign factor_1_3_2_1=(byte_2_3[7]==1'b0)?{byte_2_3[6:0],1'b0}:({byte_2_3[6:0],1'b0}^8'h1d);
assign factor_1_3_2=(factor_1_3_2_1[7]==1'b0)?{factor_1_3_2_1[6:0],1'b0}:({factor_1_3_2_1[6:0],1'b0}^8'h1d);
assign factor_1_3_3_1=(byte_3_3[7]==1'b0)?{byte_3_3[6:0],1'b0}:({byte_3_3[6:0],1'b0}^8'h1d);
assign factor_1_3_3_2=(factor_1_3_3_1[7]==1'b0)?{factor_1_3_3_1[6:0],1'b0}:({factor_1_3_3_1[6:0],1'b0}^8'h1d);
assign factor_1_3_3=(factor_1_3_3_2[7]==1'b0)?{factor_1_3_3_2[6:0],1'b0}:({factor_1_3_3_2[6:0],1'b0}^8'h1d);
assign data_out[71:64]=factor_1_3_0^factor_1_3_1^factor_1_3_2^factor_1_3_3;


//liczę trzeci wiersz:
// pierwsza kolumna
//dodatkowe
wire [7:0] factor_2_0_1_1;
wire [7:0] factor_2_0_1_2;

wire [7:0] factor_2_0_2_1;
wire [7:0] factor_2_0_2_2;
wire [7:0] factor_2_0_2_3;
wire [7:0] factor_2_0_2_4;
wire [7:0] factor_2_0_2_5;

wire [7:0] factor_2_0_3_1;
wire [7:0] factor_2_0_3_2;
wire [7:0] factor_2_0_3_3;
wire [7:0] factor_2_0_3_4;
wire [7:0] factor_2_0_3_5;
wire [7:0] factor_2_0_3_6;
wire [7:0] factor_2_0_3_7;
wire [7:0] factor_2_0_3_8;

assign factor_2_0_0=byte_0_0;

assign factor_2_0_1_1=(byte_1_0[7]==1'b0)?{byte_1_0[6:0],1'b0}:({byte_1_0[6:0],1'b0}^8'h1d);
assign factor_2_0_1_2=byte_1_0^factor_2_0_1_1;
assign factor_2_0_1=(factor_2_0_1_2[7]==1'b0)?{factor_2_0_1_2[6:0],1'b0}:({factor_2_0_1_2[6:0],1'b0}^8'h1d);


assign factor_2_0_2_1=(byte_2_0[7]==1'b0)?{byte_2_0[6:0],1'b0}:({byte_2_0[6:0],1'b0}^8'h1d);
assign factor_2_0_2_2=byte_2_0^factor_2_0_2_1;
assign factor_2_0_2_3=(factor_2_0_2_2[7]==1'b0)?{factor_2_0_2_2[6:0],1'b0}:({factor_2_0_2_2[6:0],1'b0}^8'h1d);
assign factor_2_0_2_4=(factor_2_0_2_3[7]==1'b0)?{factor_2_0_2_3[6:0],1'b0}:({factor_2_0_2_3[6:0],1'b0}^8'h1d);
assign factor_2_0_2_5=factor_2_0_2_4^factor_2_0_2_3;
assign factor_2_0_2=(factor_2_0_2_5[7]==1'b0)?{factor_2_0_2_5[6:0],1'b0}:({factor_2_0_2_5[6:0],1'b0}^8'h1d);


assign factor_2_0_3_1=(byte_3_0[7]==1'b0)?{byte_3_0[6:0],1'b0}:({byte_3_0[6:0],1'b0}^8'h1d);
assign factor_2_0_3_2=byte_3_0^factor_2_0_3_1;
assign factor_2_0_3_3=(factor_2_0_3_2[7]==1'b0)?{factor_2_0_3_2[6:0],1'b0}:({factor_2_0_3_2[6:0],1'b0}^8'h1d);
assign factor_2_0_3_4=(factor_2_0_3_3[7]==1'b0)?{factor_2_0_3_3[6:0],1'b0}:({factor_2_0_3_3[6:0],1'b0}^8'h1d);
assign factor_2_0_3_5=factor_2_0_3_4^factor_2_0_3_3;
assign factor_2_0_3_6=(factor_2_0_3_5[7]==1'b0)?{factor_2_0_3_5[6:0],1'b0}:({factor_2_0_3_5[6:0],1'b0}^8'h1d);
assign factor_2_0_3_7=(factor_2_0_3_6[7]==1'b0)?{factor_2_0_3_6[6:0],1'b0}:({factor_2_0_3_6[6:0],1'b0}^8'h1d);
assign factor_2_0_3_8=factor_2_0_3_7^factor_2_0_3_6;
assign factor_2_0_3=(factor_2_0_3_8[7]==1'b0)?{factor_2_0_3_8[6:0],1'b0}:({factor_2_0_3_8[6:0],1'b0}^8'h1d);

assign data_out[63:56]=factor_2_0_0^factor_2_0_1^factor_2_0_2^factor_2_0_3;

// druga kolumna
//dodatkowe
wire [7:0] factor_2_1_1_1;
wire [7:0] factor_2_1_1_2;
wire [7:0] factor_2_1_2_1;
wire [7:0] factor_2_1_2_2;
wire [7:0] factor_2_1_2_3;
wire [7:0] factor_2_1_2_4;
wire [7:0] factor_2_1_2_5;
wire [7:0] factor_2_1_3_1;
wire [7:0] factor_2_1_3_2;
wire [7:0] factor_2_1_3_3;
wire [7:0] factor_2_1_3_4;
wire [7:0] factor_2_1_3_5;
wire [7:0] factor_2_1_3_6;
wire [7:0] factor_2_1_3_7;
wire [7:0] factor_2_1_3_8;

assign factor_2_1_0=byte_0_1;

assign factor_2_1_1_1=(byte_1_1[7]==1'b0)?{byte_1_1[6:0],1'b0}:({byte_1_1[6:0],1'b0}^8'h1d);
assign factor_2_1_1_2=byte_1_1^factor_2_1_1_1;
assign factor_2_1_1=(factor_2_1_1_2[7]==1'b0)?{factor_2_1_1_2[6:0],1'b0}:({factor_2_1_1_2[6:0],1'b0}^8'h1d);


assign factor_2_1_2_1=(byte_2_1[7]==1'b0)?{byte_2_1[6:0],1'b0}:({byte_2_1[6:0],1'b0}^8'h1d);
assign factor_2_1_2_2=byte_2_1^factor_2_1_2_1;
assign factor_2_1_2_3=(factor_2_1_2_2[7]==1'b0)?{factor_2_1_2_2[6:0],1'b0}:({factor_2_1_2_2[6:0],1'b0}^8'h1d);
assign factor_2_1_2_4=(factor_2_1_2_3[7]==1'b0)?{factor_2_1_2_3[6:0],1'b0}:({factor_2_1_2_3[6:0],1'b0}^8'h1d);
assign factor_2_1_2_5=factor_2_1_2_4^factor_2_1_2_3;
assign factor_2_1_2=(factor_2_1_2_5[7]==1'b0)?{factor_2_1_2_5[6:0],1'b0}:({factor_2_1_2_5[6:0],1'b0}^8'h1d);


assign factor_2_1_3_1=(byte_3_1[7]==1'b0)?{byte_3_1[6:0],1'b0}:({byte_3_1[6:0],1'b0}^8'h1d);
assign factor_2_1_3_2=byte_3_1^factor_2_1_3_1;
assign factor_2_1_3_3=(factor_2_1_3_2[7]==1'b0)?{factor_2_1_3_2[6:0],1'b0}:({factor_2_1_3_2[6:0],1'b0}^8'h1d);
assign factor_2_1_3_4=(factor_2_1_3_3[7]==1'b0)?{factor_2_1_3_3[6:0],1'b0}:({factor_2_1_3_3[6:0],1'b0}^8'h1d);
assign factor_2_1_3_5=factor_2_1_3_4^factor_2_1_3_3;
assign factor_2_1_3_6=(factor_2_1_3_5[7]==1'b0)?{factor_2_1_3_5[6:0],1'b0}:({factor_2_1_3_5[6:0],1'b0}^8'h1d);
assign factor_2_1_3_7=(factor_2_1_3_6[7]==1'b0)?{factor_2_1_3_6[6:0],1'b0}:({factor_2_1_3_6[6:0],1'b0}^8'h1d);
assign factor_2_1_3_8=factor_2_1_3_7^factor_2_1_3_6;
assign factor_2_1_3=(factor_2_1_3_8[7]==1'b0)?{factor_2_1_3_8[6:0],1'b0}:({factor_2_1_3_8[6:0],1'b0}^8'h1d);
assign data_out[55:48]=factor_2_1_0^factor_2_1_1^factor_2_1_2^factor_2_1_3;


// trzecia kolumna

wire [7:0] factor_2_2_1_1;
wire [7:0] factor_2_2_1_2;
wire [7:0] factor_2_2_2_1;
wire [7:0] factor_2_2_2_2;
wire [7:0] factor_2_2_2_3;
wire [7:0] factor_2_2_2_4;
wire [7:0] factor_2_2_2_5;
wire [7:0] factor_2_2_3_1;
wire [7:0] factor_2_2_3_2;
wire [7:0] factor_2_2_3_3;
wire [7:0] factor_2_2_3_4;
wire [7:0] factor_2_2_3_5;
wire [7:0] factor_2_2_3_6;
wire [7:0] factor_2_2_3_7;
wire [7:0] factor_2_2_3_8;

assign factor_2_2_0=byte_0_2;

assign factor_2_2_1_1=(byte_1_2[7]==1'b0)?{byte_1_2[6:0],1'b0}:({byte_1_2[6:0],1'b0}^8'h1d);
assign factor_2_2_1_2=byte_1_2^factor_2_2_1_1;
assign factor_2_2_1=(factor_2_2_1_2[7]==1'b0)?{factor_2_2_1_2[6:0],1'b0}:({factor_2_2_1_2[6:0],1'b0}^8'h1d);


assign factor_2_2_2_1=(byte_2_2[7]==1'b0)?{byte_2_2[6:0],1'b0}:({byte_2_2[6:0],1'b0}^8'h1d);
assign factor_2_2_2_2=byte_2_2^factor_2_2_2_1;
assign factor_2_2_2_3=(factor_2_2_2_2[7]==1'b0)?{factor_2_2_2_2[6:0],1'b0}:({factor_2_2_2_2[6:0],1'b0}^8'h1d);
assign factor_2_2_2_4=(factor_2_2_2_3[7]==1'b0)?{factor_2_2_2_3[6:0],1'b0}:({factor_2_2_2_3[6:0],1'b0}^8'h1d);
assign factor_2_2_2_5=factor_2_2_2_4^factor_2_2_2_3;
assign factor_2_2_2=(factor_2_2_2_5[7]==1'b0)?{factor_2_2_2_5[6:0],1'b0}:({factor_2_2_2_5[6:0],1'b0}^8'h1d);


assign factor_2_2_3_1=(byte_3_2[7]==1'b0)?{byte_3_2[6:0],1'b0}:({byte_3_2[6:0],1'b0}^8'h1d);
assign factor_2_2_3_2=byte_3_2^factor_2_2_3_1;
assign factor_2_2_3_3=(factor_2_2_3_2[7]==1'b0)?{factor_2_2_3_2[6:0],1'b0}:({factor_2_2_3_2[6:0],1'b0}^8'h1d);
assign factor_2_2_3_4=(factor_2_2_3_3[7]==1'b0)?{factor_2_2_3_3[6:0],1'b0}:({factor_2_2_3_3[6:0],1'b0}^8'h1d);
assign factor_2_2_3_5=factor_2_2_3_4^factor_2_2_3_3;
assign factor_2_2_3_6=(factor_2_2_3_5[7]==1'b0)?{factor_2_2_3_5[6:0],1'b0}:({factor_2_2_3_5[6:0],1'b0}^8'h1d);
assign factor_2_2_3_7=(factor_2_2_3_6[7]==1'b0)?{factor_2_2_3_6[6:0],1'b0}:({factor_2_2_3_6[6:0],1'b0}^8'h1d);
assign factor_2_2_3_8=factor_2_2_3_7^factor_2_2_3_6;
assign factor_2_2_3=(factor_2_2_3_8[7]==1'b0)?{factor_2_2_3_8[6:0],1'b0}:({factor_2_2_3_8[6:0],1'b0}^8'h1d);

assign data_out[47:40]=factor_2_2_0^factor_2_2_1^factor_2_2_2^factor_2_2_3;


//czwarta kolumna

wire [7:0] factor_2_3_1_1;
wire [7:0] factor_2_3_1_2;
wire [7:0] factor_2_3_2_1;
wire [7:0] factor_2_3_2_2;
wire [7:0] factor_2_3_2_3;
wire [7:0] factor_2_3_2_4;
wire [7:0] factor_2_3_2_5;
wire [7:0] factor_2_3_3_1;
wire [7:0] factor_2_3_3_2;
wire [7:0] factor_2_3_3_3;
wire [7:0] factor_2_3_3_4;
wire [7:0] factor_2_3_3_5;
wire [7:0] factor_2_3_3_6;
wire [7:0] factor_2_3_3_7;
wire [7:0] factor_2_3_3_8;


assign factor_2_3_0=byte_0_3;

assign factor_2_3_1_1=(byte_1_3[7]==1'b0)?{byte_1_3[6:0],1'b0}:({byte_1_3[6:0],1'b0}^8'h1d);
assign factor_2_3_1_2=byte_1_3^factor_2_3_1_1;
assign factor_2_3_1=(factor_2_3_1_2[7]==1'b0)?{factor_2_3_1_2[6:0],1'b0}:({factor_2_3_1_2[6:0],1'b0}^8'h1d);


assign factor_2_3_2_1=(byte_2_3[7]==1'b0)?{byte_2_3[6:0],1'b0}:({byte_2_3[6:0],1'b0}^8'h1d);
assign factor_2_3_2_2=byte_2_3^factor_2_3_2_1;
assign factor_2_3_2_3=(factor_2_3_2_2[7]==1'b0)?{factor_2_3_2_2[6:0],1'b0}:({factor_2_3_2_2[6:0],1'b0}^8'h1d);
assign factor_2_3_2_4=(factor_2_3_2_3[7]==1'b0)?{factor_2_3_2_3[6:0],1'b0}:({factor_2_3_2_3[6:0],1'b0}^8'h1d);
assign factor_2_3_2_5=factor_2_3_2_4^factor_2_3_2_3;
assign factor_2_3_2=(factor_2_3_2_5[7]==1'b0)?{factor_2_3_2_5[6:0],1'b0}:({factor_2_3_2_5[6:0],1'b0}^8'h1d);


assign factor_2_3_3_1=(byte_3_3[7]==1'b0)?{byte_3_3[6:0],1'b0}:({byte_3_3[6:0],1'b0}^8'h1d);
assign factor_2_3_3_2=byte_3_3^factor_2_3_3_1;
assign factor_2_3_3_3=(factor_2_3_3_2[7]==1'b0)?{factor_2_3_3_2[6:0],1'b0}:({factor_2_3_3_2[6:0],1'b0}^8'h1d);
assign factor_2_3_3_4=(factor_2_3_3_3[7]==1'b0)?{factor_2_3_3_3[6:0],1'b0}:({factor_2_3_3_3[6:0],1'b0}^8'h1d);
assign factor_2_3_3_5=factor_2_3_3_4^factor_2_3_3_3;
assign factor_2_3_3_6=(factor_2_3_3_5[7]==1'b0)?{factor_2_3_3_5[6:0],1'b0}:({factor_2_3_3_5[6:0],1'b0}^8'h1d);
assign factor_2_3_3_7=(factor_2_3_3_6[7]==1'b0)?{factor_2_3_3_6[6:0],1'b0}:({factor_2_3_3_6[6:0],1'b0}^8'h1d);
assign factor_2_3_3_8=factor_2_3_3_7^factor_2_3_3_6;
assign factor_2_3_3=(factor_2_3_3_8[7]==1'b0)?{factor_2_3_3_8[6:0],1'b0}:({factor_2_3_3_8[6:0],1'b0}^8'h1d);

assign data_out[39:32]=factor_2_3_0^factor_2_3_1^factor_2_3_2^factor_2_3_3;




// liczę wiersz 4

// pierwsza kolumna
wire [7:0] factor_3_0_1_1;
wire [7:0] factor_3_0_1_2;
wire [7:0] factor_3_0_2_1;
wire [7:0] factor_3_0_2_2;
wire [7:0] factor_3_0_2_3;
wire [7:0] factor_3_0_2_4;
wire [7:0] factor_3_0_2_5;
wire [7:0] factor_3_0_3_1;
wire [7:0] factor_3_0_3_2;
wire [7:0] factor_3_0_3_3;
wire [7:0] factor_3_0_3_4;
wire [7:0] factor_3_0_3_5;
wire [7:0] factor_3_0_3_6;
wire [7:0] factor_3_0_3_7;
wire [7:0] factor_3_0_3_8;

assign factor_3_0_0=byte_0_0;

assign factor_3_0_1_1=(byte_1_0[7]==1'b0)?{byte_1_0[6:0],1'b0}:({byte_1_0[6:0],1'b0}^8'h1d);
assign factor_3_0_1_2=(factor_3_0_1_1[7]==1'b0)?{factor_3_0_1_1[6:0],1'b0}:({factor_3_0_1_1[6:0],1'b0}^8'h1d);
assign factor_3_0_1=(factor_3_0_1_2[7]==1'b0)?{factor_3_0_1_2[6:0],1'b0}:({factor_3_0_1_2[6:0],1'b0}^8'h1d);

assign factor_3_0_2_1=(byte_2_0[7]==1'b0)?{byte_2_0[6:0],1'b0}:({byte_2_0[6:0],1'b0}^8'h1d);
assign factor_3_0_2_2=(factor_3_0_2_1[7]==1'b0)?{factor_3_0_2_1[6:0],1'b0}:({factor_3_0_2_1[6:0],1'b0}^8'h1d);
assign factor_3_0_2_3=(factor_3_0_2_2[7]==1'b0)?{factor_3_0_2_2[6:0],1'b0}:({factor_3_0_2_2[6:0],1'b0}^8'h1d);
assign factor_3_0_2_4=(factor_3_0_2_3[7]==1'b0)?{factor_3_0_2_3[6:0],1'b0}:({factor_3_0_2_3[6:0],1'b0}^8'h1d);
assign factor_3_0_2_5=(factor_3_0_2_4[7]==1'b0)?{factor_3_0_2_4[6:0],1'b0}:({factor_3_0_2_4[6:0],1'b0}^8'h1d);
assign factor_3_0_2=(factor_3_0_2_5[7]==1'b0)?{factor_3_0_2_5[6:0],1'b0}:({factor_3_0_2_5[6:0],1'b0}^8'h1d);

assign factor_3_0_3_1=(byte_3_0[7]==1'b0)?{byte_3_0[6:0],1'b0}:({byte_3_0[6:0],1'b0}^8'h1d);
assign factor_3_0_3_2=(factor_3_0_3_1[7]==1'b0)?{factor_3_0_3_1[6:0],1'b0}:({factor_3_0_3_1[6:0],1'b0}^8'h1d);
assign factor_3_0_3_3=(factor_3_0_3_2[7]==1'b0)?{factor_3_0_3_2[6:0],1'b0}:({factor_3_0_3_2[6:0],1'b0}^8'h1d);
assign factor_3_0_3_4=(factor_3_0_3_3[7]==1'b0)?{factor_3_0_3_3[6:0],1'b0}:({factor_3_0_3_3[6:0],1'b0}^8'h1d);
assign factor_3_0_3_5=(factor_3_0_3_4[7]==1'b0)?{factor_3_0_3_4[6:0],1'b0}:({factor_3_0_3_4[6:0],1'b0}^8'h1d);
assign factor_3_0_3_6=(factor_3_0_3_5[7]==1'b0)?{factor_3_0_3_5[6:0],1'b0}:({factor_3_0_3_5[6:0],1'b0}^8'h1d);
assign factor_3_0_3_7=(factor_3_0_3_6[7]==1'b0)?{factor_3_0_3_6[6:0],1'b0}:({factor_3_0_3_6[6:0],1'b0}^8'h1d);
assign factor_3_0_3_8=(factor_3_0_3_7[7]==1'b0)?{factor_3_0_3_7[6:0],1'b0}:({factor_3_0_3_7[6:0],1'b0}^8'h1d);
assign factor_3_0_3=(factor_3_0_3_8[7]==1'b0)?{factor_3_0_3_8[6:0],1'b0}:({factor_3_0_3_8[6:0],1'b0}^8'h1d);

assign data_out[31:24]=factor_3_0_0^factor_3_0_1^factor_3_0_2^factor_3_0_3;


// druga kolumna
wire [7:0] factor_3_1_1_1;
wire [7:0] factor_3_1_1_2;
wire [7:0] factor_3_1_2_1;
wire [7:0] factor_3_1_2_2;
wire [7:0] factor_3_1_2_3;
wire [7:0] factor_3_1_2_4;
wire [7:0] factor_3_1_2_5;
wire [7:0] factor_3_1_3_1;
wire [7:0] factor_3_1_3_2;
wire [7:0] factor_3_1_3_3;
wire [7:0] factor_3_1_3_4;
wire [7:0] factor_3_1_3_5;
wire [7:0] factor_3_1_3_6;
wire [7:0] factor_3_1_3_7;
wire [7:0] factor_3_1_3_8;

assign factor_3_1_0=byte_0_1;

assign factor_3_1_1_1=(byte_1_1[7]==1'b0)?{byte_1_1[6:0],1'b0}:({byte_1_1[6:0],1'b0}^8'h1d);
assign factor_3_1_1_2=(factor_3_1_1_1[7]==1'b0)?{factor_3_1_1_1[6:0],1'b0}:({factor_3_1_1_1[6:0],1'b0}^8'h1d);
assign factor_3_1_1=(factor_3_1_1_2[7]==1'b0)?{factor_3_1_1_2[6:0],1'b0}:({factor_3_1_1_2[6:0],1'b0}^8'h1d);

assign factor_3_1_2_1=(byte_2_1[7]==1'b0)?{byte_2_1[6:0],1'b0}:({byte_2_1[6:0],1'b0}^8'h1d);
assign factor_3_1_2_2=(factor_3_1_2_1[7]==1'b0)?{factor_3_1_2_1[6:0],1'b0}:({factor_3_1_2_1[6:0],1'b0}^8'h1d);
assign factor_3_1_2_3=(factor_3_1_2_2[7]==1'b0)?{factor_3_1_2_2[6:0],1'b0}:({factor_3_1_2_2[6:0],1'b0}^8'h1d);
assign factor_3_1_2_4=(factor_3_1_2_3[7]==1'b0)?{factor_3_1_2_3[6:0],1'b0}:({factor_3_1_2_3[6:0],1'b0}^8'h1d);
assign factor_3_1_2_5=(factor_3_1_2_4[7]==1'b0)?{factor_3_1_2_4[6:0],1'b0}:({factor_3_1_2_4[6:0],1'b0}^8'h1d);
assign factor_3_1_2=(factor_3_1_2_5[7]==1'b0)?{factor_3_1_2_5[6:0],1'b0}:({factor_3_1_2_5[6:0],1'b0}^8'h1d);

assign factor_3_1_3_1=(byte_3_1[7]==1'b0)?{byte_3_1[6:0],1'b0}:({byte_3_1[6:0],1'b0}^8'h1d);
assign factor_3_1_3_2=(factor_3_1_3_1[7]==1'b0)?{factor_3_1_3_1[6:0],1'b0}:({factor_3_1_3_1[6:0],1'b0}^8'h1d);
assign factor_3_1_3_3=(factor_3_1_3_2[7]==1'b0)?{factor_3_1_3_2[6:0],1'b0}:({factor_3_1_3_2[6:0],1'b0}^8'h1d);
assign factor_3_1_3_4=(factor_3_1_3_3[7]==1'b0)?{factor_3_1_3_3[6:0],1'b0}:({factor_3_1_3_3[6:0],1'b0}^8'h1d);
assign factor_3_1_3_5=(factor_3_1_3_4[7]==1'b0)?{factor_3_1_3_4[6:0],1'b0}:({factor_3_1_3_4[6:0],1'b0}^8'h1d);
assign factor_3_1_3_6=(factor_3_1_3_5[7]==1'b0)?{factor_3_1_3_5[6:0],1'b0}:({factor_3_1_3_5[6:0],1'b0}^8'h1d);
assign factor_3_1_3_7=(factor_3_1_3_6[7]==1'b0)?{factor_3_1_3_6[6:0],1'b0}:({factor_3_1_3_6[6:0],1'b0}^8'h1d);
assign factor_3_1_3_8=(factor_3_1_3_7[7]==1'b0)?{factor_3_1_3_7[6:0],1'b0}:({factor_3_1_3_7[6:0],1'b0}^8'h1d);
assign factor_3_1_3=(factor_3_1_3_8[7]==1'b0)?{factor_3_1_3_8[6:0],1'b0}:({factor_3_1_3_8[6:0],1'b0}^8'h1d);

assign data_out[23:16]=factor_3_1_0^factor_3_1_1^factor_3_1_2^factor_3_1_3;


// trzecia kolumna
wire [7:0] factor_3_2_1_1;
wire [7:0] factor_3_2_1_2;
wire [7:0] factor_3_2_2_1;
wire [7:0] factor_3_2_2_2;
wire [7:0] factor_3_2_2_3;
wire [7:0] factor_3_2_2_4;
wire [7:0] factor_3_2_2_5;
wire [7:0] factor_3_2_3_1;
wire [7:0] factor_3_2_3_2;
wire [7:0] factor_3_2_3_3;
wire [7:0] factor_3_2_3_4;
wire [7:0] factor_3_2_3_5;
wire [7:0] factor_3_2_3_6;
wire [7:0] factor_3_2_3_7;
wire [7:0] factor_3_2_3_8;

assign factor_3_2_0=byte_0_2;

assign factor_3_2_1_1=(byte_1_2[7]==1'b0)?{byte_1_2[6:0],1'b0}:({byte_1_2[6:0],1'b0}^8'h1d);
assign factor_3_2_1_2=(factor_3_2_1_1[7]==1'b0)?{factor_3_2_1_1[6:0],1'b0}:({factor_3_2_1_1[6:0],1'b0}^8'h1d);
assign factor_3_2_1=(factor_3_2_1_2[7]==1'b0)?{factor_3_2_1_2[6:0],1'b0}:({factor_3_2_1_2[6:0],1'b0}^8'h1d);

assign factor_3_2_2_1=(byte_2_2[7]==1'b0)?{byte_2_2[6:0],1'b0}:({byte_2_2[6:0],1'b0}^8'h1d);
assign factor_3_2_2_2=(factor_3_2_2_1[7]==1'b0)?{factor_3_2_2_1[6:0],1'b0}:({factor_3_2_2_1[6:0],1'b0}^8'h1d);
assign factor_3_2_2_3=(factor_3_2_2_2[7]==1'b0)?{factor_3_2_2_2[6:0],1'b0}:({factor_3_2_2_2[6:0],1'b0}^8'h1d);
assign factor_3_2_2_4=(factor_3_2_2_3[7]==1'b0)?{factor_3_2_2_3[6:0],1'b0}:({factor_3_2_2_3[6:0],1'b0}^8'h1d);
assign factor_3_2_2_5=(factor_3_2_2_4[7]==1'b0)?{factor_3_2_2_4[6:0],1'b0}:({factor_3_2_2_4[6:0],1'b0}^8'h1d);
assign factor_3_2_2=(factor_3_2_2_5[7]==1'b0)?{factor_3_2_2_5[6:0],1'b0}:({factor_3_2_2_5[6:0],1'b0}^8'h1d);

assign factor_3_2_3_1=(byte_3_1[7]==1'b0)?{byte_3_1[6:0],1'b0}:({byte_3_1[6:0],1'b0}^8'h1d);
assign factor_3_2_3_2=(factor_3_2_3_1[7]==1'b0)?{factor_3_2_3_1[6:0],1'b0}:({factor_3_2_3_1[6:0],1'b0}^8'h1d);
assign factor_3_2_3_3=(factor_3_2_3_2[7]==1'b0)?{factor_3_2_3_2[6:0],1'b0}:({factor_3_2_3_2[6:0],1'b0}^8'h1d);
assign factor_3_2_3_4=(factor_3_2_3_3[7]==1'b0)?{factor_3_2_3_3[6:0],1'b0}:({factor_3_2_3_3[6:0],1'b0}^8'h1d);
assign factor_3_2_3_5=(factor_3_2_3_4[7]==1'b0)?{factor_3_2_3_4[6:0],1'b0}:({factor_3_2_3_4[6:0],1'b0}^8'h1d);
assign factor_3_2_3_6=(factor_3_2_3_5[7]==1'b0)?{factor_3_2_3_5[6:0],1'b0}:({factor_3_2_3_5[6:0],1'b0}^8'h1d);
assign factor_3_2_3_7=(factor_3_2_3_6[7]==1'b0)?{factor_3_2_3_6[6:0],1'b0}:({factor_3_2_3_6[6:0],1'b0}^8'h1d);
assign factor_3_2_3_8=(factor_3_2_3_7[7]==1'b0)?{factor_3_2_3_7[6:0],1'b0}:({factor_3_2_3_7[6:0],1'b0}^8'h1d);
assign factor_3_2_3=(factor_3_2_3_8[7]==1'b0)?{factor_3_2_3_8[6:0],1'b0}:({factor_3_2_3_8[6:0],1'b0}^8'h1d);

assign data_out[15:8]=factor_3_2_0^factor_3_2_1^factor_3_2_2^factor_3_2_3;

// czwarta kolumna
wire [7:0] factor_3_3_1_1;
wire [7:0] factor_3_3_1_2;
wire [7:0] factor_3_3_2_1;
wire [7:0] factor_3_3_2_2;
wire [7:0] factor_3_3_2_3;
wire [7:0] factor_3_3_2_4;
wire [7:0] factor_3_3_2_5;
wire [7:0] factor_3_3_3_1;
wire [7:0] factor_3_3_3_2;
wire [7:0] factor_3_3_3_3;
wire [7:0] factor_3_3_3_4;
wire [7:0] factor_3_3_3_5;
wire [7:0] factor_3_3_3_6;
wire [7:0] factor_3_3_3_7;
wire [7:0] factor_3_3_3_8;

assign factor_3_3_0=byte_0_3;

assign factor_3_3_1_1=(byte_1_3[7]==1'b0)?{byte_1_3[6:0],1'b0}:({byte_1_3[6:0],1'b0}^8'h1d);
assign factor_3_3_1_2=(factor_3_3_1_1[7]==1'b0)?{factor_3_3_1_1[6:0],1'b0}:({factor_3_3_1_1[6:0],1'b0}^8'h1d);
assign factor_3_3_1=(factor_3_3_1_2[7]==1'b0)?{factor_3_3_1_2[6:0],1'b0}:({factor_3_3_1_2[6:0],1'b0}^8'h1d);

assign factor_3_3_2_1=(byte_2_3[7]==1'b0)?{byte_2_3[6:0],1'b0}:({byte_2_3[6:0],1'b0}^8'h1d);
assign factor_3_3_2_2=(factor_3_3_2_1[7]==1'b0)?{factor_3_3_2_1[6:0],1'b0}:({factor_3_3_2_1[6:0],1'b0}^8'h1d);
assign factor_3_3_2_3=(factor_3_3_2_2[7]==1'b0)?{factor_3_3_2_2[6:0],1'b0}:({factor_3_3_2_2[6:0],1'b0}^8'h1d);
assign factor_3_3_2_4=(factor_3_3_2_3[7]==1'b0)?{factor_3_3_2_3[6:0],1'b0}:({factor_3_3_2_3[6:0],1'b0}^8'h1d);
assign factor_3_3_2_5=(factor_3_3_2_4[7]==1'b0)?{factor_3_3_2_4[6:0],1'b0}:({factor_3_3_2_4[6:0],1'b0}^8'h1d);
assign factor_3_3_2=(factor_3_3_2_5[7]==1'b0)?{factor_3_3_2_5[6:0],1'b0}:({factor_3_3_2_5[6:0],1'b0}^8'h1d);

assign factor_3_3_3_1=(byte_3_3[7]==1'b0)?{byte_3_3[6:0],1'b0}:({byte_3_3[6:0],1'b0}^8'h1d);
assign factor_3_3_3_2=(factor_3_3_3_1[7]==1'b0)?{factor_3_3_3_1[6:0],1'b0}:({factor_3_3_3_1[6:0],1'b0}^8'h1d);
assign factor_3_3_3_3=(factor_3_3_3_2[7]==1'b0)?{factor_3_3_3_2[6:0],1'b0}:({factor_3_3_3_2[6:0],1'b0}^8'h1d);
assign factor_3_3_3_4=(factor_3_3_3_3[7]==1'b0)?{factor_3_3_3_3[6:0],1'b0}:({factor_3_3_3_3[6:0],1'b0}^8'h1d);
assign factor_3_3_3_5=(factor_3_3_3_4[7]==1'b0)?{factor_3_3_3_4[6:0],1'b0}:({factor_3_3_3_4[6:0],1'b0}^8'h1d);
assign factor_3_3_3_6=(factor_3_3_3_5[7]==1'b0)?{factor_3_3_3_5[6:0],1'b0}:({factor_3_3_3_5[6:0],1'b0}^8'h1d);
assign factor_3_3_3_7=(factor_3_3_3_6[7]==1'b0)?{factor_3_3_3_6[6:0],1'b0}:({factor_3_3_3_6[6:0],1'b0}^8'h1d);
assign factor_3_3_3_8=(factor_3_3_3_7[7]==1'b0)?{factor_3_3_3_7[6:0],1'b0}:({factor_3_3_3_7[6:0],1'b0}^8'h1d);
assign factor_3_3_3=(factor_3_3_3_8[7]==1'b0)?{factor_3_3_3_8[6:0],1'b0}:({factor_3_3_3_8[6:0],1'b0}^8'h1d);

assign data_out[7:0]=factor_3_3_0^factor_3_3_1^factor_3_3_2^factor_3_3_3;





endmodule
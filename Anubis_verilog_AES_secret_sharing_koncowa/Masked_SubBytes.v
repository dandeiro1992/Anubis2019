`timescale 1ns / 1ps

module Masked_SubBytes (
    input  wire [7 : 0] data_in_1,
	 input  wire [7 : 0] data_in_2,
	 input  wire [7 : 0] data_in_3,
	 input  wire [7 : 0] data_in_4,
	 input  wire [19: 0] random,
    output wire [7 : 0] data_out_1,
	 output wire [7 : 0] data_out_2,
	 output wire [7 : 0] data_out_3
);
wire [3:0] r_1,r_2,r_3,r_4,r_5;

assign r_1=random[19:16];
assign r_2=random[15:12];
assign r_3=random[11:8];
assign r_4=random[7:4];
assign r_5=random[3:0];

wire [7:0] temp_1,temp_2,temp_3,temp_4;

ISOMORPHISM iso_1(.data_in(data_in_1),.data_out(temp_1));
ISOMORPHISM iso_2(.data_in(data_in_2),.data_out(temp_2));
ISOMORPHISM iso_3(.data_in(data_in_3),.data_out(temp_3));
ISOMORPHISM iso_4(.data_in(data_in_4),.data_out(temp_4));

wire [3:0] a,b,c,d,x,y,z,v,i_data_1,i_data_2,i_data_3,i_data_4,i_data_5,i_data_6,i_data_7,i_data_8;

assign i_data_1=temp_1[7:4]^temp_1[3:0];
assign i_data_2=temp_2[7:4]^temp_2[3:0];
assign i_data_3=temp_3[7:4]^temp_3[3:0];
assign i_data_4=temp_4[7:4]^temp_4[3:0];
assign i_data_5=temp_1[3:0];
assign i_data_6=temp_2[3:0];
assign i_data_7=temp_3[3:0];
assign i_data_8=temp_4[3:0];

// change wiring to match inputs and outputs
assign a = {i_data_1[3], i_data_2[3], i_data_3[3], i_data_4[3]};
assign b = {i_data_1[2], i_data_2[2], i_data_3[2], i_data_4[2]};
assign c = {i_data_1[1], i_data_2[1], i_data_3[1], i_data_4[1]};
assign d = {i_data_1[0], i_data_2[0], i_data_3[0], i_data_4[0]};

assign x = {i_data_5[3], i_data_6[3], i_data_7[3], i_data_8[3]};
assign y = {i_data_5[2], i_data_6[2], i_data_7[2], i_data_8[2]};
assign z = {i_data_5[1], i_data_6[1], i_data_7[1], i_data_8[1]};
assign v = {i_data_5[0], i_data_6[0], i_data_7[0], i_data_8[0]};

wire [3:0] S_1,S_2,S_3;

assign S_1={((a[1]^a[2]^a[3])&(x[1]^x[2]))^x[3]^
				((a[1]^a[2]^a[3])&(y[1]^y[2]))^y[3]^
				((a[1]^a[2]^a[3])&(z[1]^z[2]))^z[3]^
				((a[1]^a[2]^a[3])&(v[1]^v[2]))^v[3]^
				((b[1]^b[2]^b[3])&(x[1]^x[2]))^x[3]^
				((b[1]^b[2]^b[3])&(z[1]^z[2]))^z[3]^
				((c[1]^c[2]^c[3])&(x[1]^x[2]))^x[3]^
				((c[1]^c[2]^c[3])&(y[1]^y[2]))^y[3]^
				((d[1]^d[2]^d[3])&(x[1]^x[2]))^x[3],
				((a[1]^a[2]^a[3])&(x[1]^x[2]))^x[3]^
				((a[1]^a[2]^a[3])&(z[1]^z[2]))^z[3]^
				((b[1]^b[2]^b[3])&(y[1]^y[2]))^y[3]^
				((b[1]^b[2]^b[3])&(v[1]^v[2]))^v[3]^
				((c[1]^c[2]^c[3])&(x[1]^x[2]))^x[3]^
				((d[1]^d[2]^d[3])&(y[1]^y[2]))^y[3],
				((a[1]^a[2]^a[3])&(y[1]^y[2]))^y[3]^
				((b[1]^b[2]^b[3])&(x[1]^x[2]))^x[3]^
				((b[1]^b[2]^b[3])&(y[1]^y[2]))^y[3]^
				((c[1]^c[2]^c[3])&(z[1]^z[2]))^z[3]^
				((c[1]^c[2]^c[3])&(v[1]^v[2]))^v[3]^
				((d[1]^d[2]^d[3])&(z[1]^z[2]))^z[3],
				((a[1]^a[2]^a[3])&(x[1]^x[2]))^x[3]^
				((a[1]^a[2]^a[3])&(y[1]^y[2]))^y[3]^
				((b[1]^b[2]^b[3])&(x[1]^x[2]))^x[3]^
				((c[1]^c[2]^c[3])&(z[1]^z[2]))^z[3]^
				((d[1]^d[2]^d[3])&(v[1]^v[2]))^v[3]};
assign S_2={((a[0]^a[2])&(x[0]^x[3]))^(a[0]&x[2])^a[3]^
				((a[0]^a[2])&(y[0]^y[3]))^(a[0]&y[2])^a[3]^
				((a[0]^a[2])&(z[0]^z[3]))^(a[0]&z[2])^a[3]^
				((a[0]^a[2])&(v[0]^v[3]))^(a[0]&v[2])^a[3]^
				((b[0]^b[2])&(x[0]^x[3]))^(b[0]&x[2])^b[3]^
				((b[0]^b[2])&(z[0]^z[3]))^(b[0]&z[2])^b[3]^
				((c[0]^c[2])&(x[0]^x[3]))^(c[0]&x[2])^c[3]^
				((c[0]^c[2])&(y[0]^y[3]))^(c[0]&y[2])^c[3]^
				((d[0]^d[2])&(x[0]^x[3]))^(d[0]&x[2])^d[3],
				((a[0]^a[2])&(x[0]^x[3]))^(a[0]&x[2])^a[3]^
				((a[0]^a[2])&(z[0]^z[3]))^(a[0]&z[2])^a[3]^
				((b[0]^b[2])&(y[0]^y[3]))^(b[0]&y[2])^b[3]^
				((b[0]^b[2])&(v[0]^v[3]))^(b[0]&v[2])^b[3]^
				((c[0]^c[2])&(x[0]^x[3]))^(c[0]&x[2])^c[3]^
				((d[0]^d[2])&(y[0]^y[3]))^(d[0]&y[2])^d[3],
				((a[0]^a[2])&(y[0]^y[3]))^(a[0]&y[2])^a[3]^
				((b[0]^b[2])&(x[0]^x[3]))^(b[0]&x[2])^b[3]^
				((b[0]^b[2])&(y[0]^y[3]))^(b[0]&y[2])^b[3]^
				((c[0]^c[2])&(z[0]^z[3]))^(c[0]&z[2])^c[3]^
				((c[0]^c[2])&(v[0]^v[3]))^(c[0]&v[2])^c[3]^
				((d[0]^d[2])&(z[0]^z[3]))^(d[0]&z[2])^d[3],
				((a[0]^a[2])&(x[0]^x[3]))^(a[0]&x[2])^a[3]^
				((a[0]^a[2])&(y[0]^y[3]))^(a[0]&y[2])^a[3]^
				((b[0]^b[2])&(x[0]^x[3]))^(b[0]&x[2])^b[3]^
				((c[0]^c[2])&(z[0]^z[3]))^(c[0]&z[2])^c[3]^
				((d[0]^d[2])&(v[0]^v[3]))^(d[0]&v[2])^d[3]};
				
assign S_3={((a[1]^a[3])&(x[0]^x[3]))^(a[0]&x[1])^a[3]^x[3]^
				((a[1]^a[3])&(y[0]^y[3]))^(a[0]&y[1])^a[3]^y[3]^
				((a[1]^a[3])&(z[0]^z[3]))^(a[0]&z[1])^a[3]^z[3]^
				((a[1]^a[3])&(v[0]^v[3]))^(a[0]&v[1])^a[3]^v[3]^
				((b[1]^b[3])&(x[0]^x[3]))^(b[0]&x[1])^b[3]^x[3]^
				((b[1]^b[3])&(z[0]^z[3]))^(b[0]&z[1])^b[3]^z[3]^
				((c[1]^c[3])&(x[0]^x[3]))^(c[0]&x[1])^c[3]^x[3]^
				((c[1]^c[3])&(y[0]^y[3]))^(c[0]&y[1])^c[3]^y[3]^
				((d[1]^d[3])&(x[0]^x[3]))^(d[0]&x[1])^d[3]^x[3],
				((a[1]^a[3])&(x[0]^x[3]))^(a[0]&x[1])^a[3]^x[3]^
				((a[1]^a[3])&(z[0]^z[3]))^(a[0]&z[1])^a[3]^z[3]^
				((b[1]^b[3])&(y[0]^y[3]))^(b[0]&y[1])^b[3]^y[3]^
				((b[1]^b[3])&(v[0]^v[3]))^(b[0]&v[1])^b[3]^v[3]^
				((c[1]^c[3])&(x[0]^x[3]))^(c[0]&x[1])^c[3]^x[3]^
				((d[1]^d[3])&(y[0]^y[3]))^(d[0]&y[1])^d[3]^y[3],
				((a[1]^a[3])&(y[0]^y[3]))^(a[0]&y[1])^a[3]^y[3]^
				((b[1]^b[3])&(x[0]^x[3]))^(b[0]&x[1])^b[3]^x[3]^
				((b[1]^b[3])&(y[0]^y[3]))^(b[0]&y[1])^b[3]^y[3]^
				((c[1]^c[3])&(z[0]^z[3]))^(c[0]&z[1])^c[3]^z[3]^
				((c[1]^c[3])&(v[0]^v[3]))^(c[0]&v[1])^c[3]^v[3]^
				((d[1]^d[3])&(z[0]^z[3]))^(d[0]&z[1])^d[3]^z[3],
				((a[1]^a[3])&(x[0]^x[3]))^(a[0]&x[1])^a[3]^x[3]^
				((a[1]^a[3])&(y[0]^y[3]))^(a[0]&y[1])^a[3]^y[3]^
				((b[1]^b[3])&(x[0]^x[3]))^(b[0]&x[1])^b[3]^x[3]^
				((c[1]^c[3])&(z[0]^z[3]))^(c[0]&z[1])^c[3]^z[3]^
				((d[1]^d[3])&(v[0]^v[3]))^(d[0]&v[1])^d[3]^v[3]};
				
wire [3:0] squarer_1_in,squarer_2_in,squarer_3_in;

assign squarer_3_in=temp_1[7:4];
assign squarer_2_in=temp_2[7:4];
assign squarer_1_in=temp_3[7:4]^temp_4[7:4];

wire [3:0] squarer_1_temp_1,squarer_2_temp_1,squarer_3_temp_1;
wire [3:0] squarer_1_temp_2,squarer_2_temp_2,squarer_3_temp_2;

XSQUARE square_1(.data_in(squarer_1_in),.data_out(squarer_1_temp_1));
XLAMBDA square_11(.data_in(squarer_1_temp_1),.data_out(squarer_1_temp_2));

XSQUARE square_2(.data_in(squarer_2_in),.data_out(squarer_2_temp_1));
XLAMBDA square_22(.data_in(squarer_2_temp_1),.data_out(squarer_2_temp_2));

XSQUARE square_3(.data_in(squarer_3_in),.data_out(squarer_3_temp_1));
XLAMBDA square_33(.data_in(squarer_3_temp_1),.data_out(squarer_3_temp_2));

// wejscia do inwertera:

wire [3:0] in_0,in_1,in_2,in_3,in_4;

assign in_0=squarer_3_temp_2^r_1^squarer_1_temp_2;
assign in_1=squarer_2_temp_2^r_2;
assign in_2=r_1^r_2^S_3;
assign in_3=S_2;
assign in_4=S_1;

//wyjscie z inwertera:

wire [3:0] out_0,out_1,out_2,out_3,out_4;

Inverter invert(.in_data_1(in_0),.in_data_2(in_1),.in_data_3(in_2),.in_data_4(in_3),.in_data_5(in_4),.out_data_1(out_0),.out_data_2(out_1),.out_data_3(out_2),.out_data_4(out_3),.out_data_5(out_4));

wire [3:0] in_multi_1,in_multi_2,in_multi_3,in_multi_4,in_multi_5,in_multi_6,in_multi_7,in_multi_8,in_multi_9,in_multi_10,in_multi_11,in_multi_12,in_multi_13,in_multi_14,in_multi_15,in_multi_16;
wire [3:0] multi_1,multi_2,multi_3,multi_4,multi_5,multi_6,multi_7,multi_8,multi_9,multi_10,multi_11,multi_12,multi_13,multi_14,multi_15,multi_16;
assign in_multi_1=temp_1[7:4];
assign in_multi_2=temp_2[7:4];
assign in_multi_3=temp_3[7:4];
assign in_multi_4=temp_4[7:4];
	
assign in_multi_13=temp_1[7:4]^temp_1[3:0];
assign in_multi_14=temp_2[7:4]^temp_2[3:0];
assign in_multi_15=temp_3[7:4]^temp_3[3:0];
assign in_multi_16=temp_4[7:4]^temp_4[3:0];		

assign in_multi_5=out_0^(out_1^r_3);
assign in_multi_9=out_0^(out_1^r_3);

assign in_multi_6=out_2^r_4;
assign in_multi_10=out_2^r_4;

assign in_multi_7=out_3^r_5;
assign in_multi_11=out_3^r_5;

assign in_multi_8=out_4^(r_3^r_4^r_5);
assign in_multi_12=out_4^(r_3^r_4^r_5);


// change wiring to match inputs and outputs

assign multi_1 ={in_multi_1[3], in_multi_2[3], in_multi_3[3], in_multi_4[3]};
assign multi_2 ={in_multi_1[2], in_multi_2[2], in_multi_3[2], in_multi_4[2]};
assign multi_3 ={in_multi_1[1], in_multi_2[1], in_multi_3[1], in_multi_4[1]};
assign multi_4 ={in_multi_1[0], in_multi_2[0], in_multi_3[0], in_multi_4[0]};

assign multi_5 ={in_multi_5[3], in_multi_6[3], in_multi_7[3], in_multi_8[3]};
assign multi_6 ={in_multi_5[2], in_multi_6[2], in_multi_7[2], in_multi_8[2]};
assign multi_7 ={in_multi_5[1], in_multi_6[1], in_multi_7[1], in_multi_8[1]};
assign multi_8 ={in_multi_5[0], in_multi_6[0], in_multi_7[0], in_multi_8[0]};

wire [3:0] mult_1_out_1,mult_1_out_2,mult_1_out_3;

assign mult_1_out_1={((multi_1[1]^multi_1[2]^multi_1[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_6[1]^multi_6[2]))^multi_6[3]^
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_7[1]^multi_7[2]))^multi_7[3]^
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_8[1]^multi_8[2]))^multi_8[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_7[1]^multi_7[2]))^multi_7[3]^
						((multi_3[1]^multi_3[2]^multi_3[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_3[1]^multi_3[2]^multi_3[3])&(multi_6[1]^multi_6[2]))^multi_6[3]^
						((multi_4[1]^multi_4[2]^multi_4[3])&(multi_5[1]^multi_5[2]))^multi_5[3],
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_7[1]^multi_7[2]))^multi_7[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_6[1]^multi_6[2]))^multi_6[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_8[1]^multi_8[2]))^multi_8[3]^
						((multi_3[1]^multi_3[2]^multi_3[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_4[1]^multi_4[2]^multi_4[3])&(multi_6[1]^multi_6[2]))^multi_6[3],
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_6[1]^multi_6[2]))^multi_6[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_6[1]^multi_6[2]))^multi_6[3]^
						((multi_3[1]^multi_3[2]^multi_3[3])&(multi_7[1]^multi_7[2]))^multi_7[3]^
						((multi_3[1]^multi_3[2]^multi_3[3])&(multi_8[1]^multi_8[2]))^multi_8[3]^
						((multi_4[1]^multi_4[2]^multi_4[3])&(multi_7[1]^multi_7[2]))^multi_7[3],
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_1[1]^multi_1[2]^multi_1[3])&(multi_6[1]^multi_6[2]))^multi_6[3]^
						((multi_2[1]^multi_2[2]^multi_2[3])&(multi_5[1]^multi_5[2]))^multi_5[3]^
						((multi_3[1]^multi_3[2]^multi_3[3])&(multi_7[1]^multi_7[2]))^multi_7[3]^
						((multi_4[1]^multi_4[2]^multi_4[3])&(multi_8[1]^multi_8[2]))^multi_8[3]};
assign mult_1_out_2={((multi_1[0]^multi_1[2])&(multi_5[0]^multi_5[3]))^(multi_1[0]&multi_5[2])^multi_1[3]^
					((multi_1[0]^multi_1[2])&(multi_6[0]^multi_6[3]))^(multi_1[0]&multi_6[2])^multi_1[3]^
					((multi_1[0]^multi_1[2])&(multi_7[0]^multi_7[3]))^(multi_1[0]&multi_7[2])^multi_1[3]^
					((multi_1[0]^multi_1[2])&(multi_8[0]^multi_8[3]))^(multi_1[0]&multi_8[2])^multi_1[3]^
					((multi_2[0]^multi_2[2])&(multi_5[0]^multi_5[3]))^(multi_2[0]&multi_5[2])^multi_2[3]^
					((multi_2[0]^multi_2[2])&(multi_7[0]^multi_7[3]))^(multi_2[0]&multi_7[2])^multi_2[3]^
					((multi_3[0]^multi_3[2])&(multi_5[0]^multi_5[3]))^(multi_3[0]&multi_5[2])^multi_3[3]^
					((multi_3[0]^multi_3[2])&(multi_6[0]^multi_6[3]))^(multi_3[0]&multi_6[2])^multi_3[3]^
					((multi_4[0]^multi_4[2])&(multi_5[0]^multi_5[3]))^(multi_4[0]&multi_5[2])^multi_4[3],
					((multi_1[0]^multi_1[2])&(multi_5[0]^multi_5[3]))^(multi_1[0]&multi_5[2])^multi_1[3]^
					((multi_1[0]^multi_1[2])&(multi_7[0]^multi_7[3]))^(multi_1[0]&multi_7[2])^multi_1[3]^
					((multi_2[0]^multi_2[2])&(multi_6[0]^multi_6[3]))^(multi_2[0]&multi_6[2])^multi_2[3]^
					((multi_2[0]^multi_2[2])&(multi_8[0]^multi_8[3]))^(multi_2[0]&multi_8[2])^multi_2[3]^
					((multi_3[0]^multi_3[2])&(multi_5[0]^multi_5[3]))^(multi_3[0]&multi_5[2])^multi_3[3]^
					((multi_4[0]^multi_4[2])&(multi_6[0]^multi_6[3]))^(multi_4[0]&multi_6[2])^multi_4[3],
					((multi_1[0]^multi_1[2])&(multi_6[0]^multi_6[3]))^(multi_1[0]&multi_6[2])^multi_1[3]^
					((multi_2[0]^multi_2[2])&(multi_5[0]^multi_5[3]))^(multi_2[0]&multi_5[2])^multi_2[3]^
					((multi_2[0]^multi_2[2])&(multi_6[0]^multi_6[3]))^(multi_2[0]&multi_6[2])^multi_2[3]^
					((multi_3[0]^multi_3[2])&(multi_7[0]^multi_7[3]))^(multi_3[0]&multi_7[2])^multi_3[3]^
					((multi_3[0]^multi_3[2])&(multi_8[0]^multi_8[3]))^(multi_3[0]&multi_8[2])^multi_3[3]^
					((multi_4[0]^multi_4[2])&(multi_7[0]^multi_7[3]))^(multi_4[0]&multi_7[2])^multi_4[3],
					((multi_1[0]^multi_1[2])&(multi_5[0]^multi_5[3]))^(multi_1[0]&multi_5[2])^multi_1[3]^
					((multi_1[0]^multi_1[2])&(multi_6[0]^multi_6[3]))^(multi_1[0]&multi_6[2])^multi_1[3]^
					((multi_2[0]^multi_2[2])&(multi_5[0]^multi_5[3]))^(multi_2[0]&multi_5[2])^multi_2[3]^
					((multi_3[0]^multi_3[2])&(multi_7[0]^multi_7[3]))^(multi_3[0]&multi_7[2])^multi_3[3]^
					((multi_4[0]^multi_4[2])&(multi_8[0]^multi_8[3]))^(multi_4[0]&multi_8[2])^multi_4[3]};
				
assign mult_1_out_3={((multi_1[1]^multi_1[3])&(multi_5[0]^multi_5[3]))^(multi_1[0]&multi_5[1])^multi_1[3]^multi_5[3]^
					((multi_1[1]^multi_1[3])&(multi_6[0]^multi_6[3]))^(multi_1[0]&multi_6[1])^multi_1[3]^multi_6[3]^
					((multi_1[1]^multi_1[3])&(multi_7[0]^multi_7[3]))^(multi_1[0]&multi_7[1])^multi_1[3]^multi_7[3]^
					((multi_1[1]^multi_1[3])&(multi_8[0]^multi_8[3]))^(multi_1[0]&multi_8[1])^multi_1[3]^multi_8[3]^
					((multi_2[1]^multi_2[3])&(multi_5[0]^multi_5[3]))^(multi_2[0]&multi_5[1])^multi_2[3]^multi_5[3]^
					((multi_2[1]^multi_2[3])&(multi_7[0]^multi_7[3]))^(multi_2[0]&multi_7[1])^multi_2[3]^multi_7[3]^
					((multi_3[1]^multi_3[3])&(multi_5[0]^multi_5[3]))^(multi_3[0]&multi_5[1])^multi_3[3]^multi_5[3]^
					((multi_3[1]^multi_3[3])&(multi_6[0]^multi_6[3]))^(multi_3[0]&multi_6[1])^multi_3[3]^multi_6[3]^
					((multi_4[1]^multi_4[3])&(multi_5[0]^multi_5[3]))^(multi_4[0]&multi_5[1])^multi_4[3]^multi_5[3],
					((multi_1[1]^multi_1[3])&(multi_5[0]^multi_5[3]))^(multi_1[0]&multi_5[1])^multi_1[3]^multi_5[3]^
					((multi_1[1]^multi_1[3])&(multi_7[0]^multi_7[3]))^(multi_1[0]&multi_7[1])^multi_1[3]^multi_7[3]^
					((multi_2[1]^multi_2[3])&(multi_6[0]^multi_6[3]))^(multi_2[0]&multi_6[1])^multi_2[3]^multi_6[3]^
					((multi_2[1]^multi_2[3])&(multi_8[0]^multi_8[3]))^(multi_2[0]&multi_8[1])^multi_2[3]^multi_8[3]^
					((multi_3[1]^multi_3[3])&(multi_5[0]^multi_5[3]))^(multi_3[0]&multi_5[1])^multi_3[3]^multi_5[3]^
					((multi_4[1]^multi_4[3])&(multi_6[0]^multi_6[3]))^(multi_4[0]&multi_6[1])^multi_4[3]^multi_6[3],
					((multi_1[1]^multi_1[3])&(multi_6[0]^multi_6[3]))^(multi_1[0]&multi_6[1])^multi_1[3]^multi_6[3]^
					((multi_2[1]^multi_2[3])&(multi_5[0]^multi_5[3]))^(multi_2[0]&multi_5[1])^multi_2[3]^multi_5[3]^
					((multi_2[1]^multi_2[3])&(multi_6[0]^multi_6[3]))^(multi_2[0]&multi_6[1])^multi_2[3]^multi_6[3]^
					((multi_3[1]^multi_3[3])&(multi_7[0]^multi_7[3]))^(multi_3[0]&multi_7[1])^multi_3[3]^multi_7[3]^
					((multi_3[1]^multi_3[3])&(multi_8[0]^multi_8[3]))^(multi_3[0]&multi_8[1])^multi_3[3]^multi_8[3]^
					((multi_4[1]^multi_4[3])&(multi_7[0]^multi_7[3]))^(multi_4[0]&multi_7[1])^multi_4[3]^multi_7[3],
					((multi_1[1]^multi_1[3])&(multi_5[0]^multi_5[3]))^(multi_1[0]&multi_5[1])^multi_1[3]^multi_5[3]^
					((multi_1[1]^multi_1[3])&(multi_6[0]^multi_6[3]))^(multi_1[0]&multi_6[1])^multi_1[3]^multi_6[3]^
					((multi_2[1]^multi_2[3])&(multi_5[0]^multi_5[3]))^(multi_2[0]&multi_5[1])^multi_2[3]^multi_5[3]^
					((multi_3[1]^multi_3[3])&(multi_7[0]^multi_7[3]))^(multi_3[0]&multi_7[1])^multi_3[3]^multi_7[3]^
					((multi_4[1]^multi_4[3])&(multi_8[0]^multi_8[3]))^(multi_4[0]&multi_8[1])^multi_4[3]^multi_8[3]};
					
wire [3:0] mult_2_out_1,mult_2_out_2,mult_2_out_3;

// change wiring to match inputs and outputs

assign multi_9  ={in_multi_9[3], in_multi_10[3], in_multi_11[3], in_multi_12[3]};
assign multi_10 ={in_multi_9[2], in_multi_10[2], in_multi_11[2], in_multi_12[2]};
assign multi_11 ={in_multi_9[1], in_multi_10[1], in_multi_11[1], in_multi_12[1]};
assign multi_12 ={in_multi_9[0], in_multi_10[0], in_multi_11[0], in_multi_12[0]};

assign multi_13 ={in_multi_13[3], in_multi_14[3], in_multi_15[3], in_multi_16[3]};
assign multi_14 ={in_multi_13[2], in_multi_14[2], in_multi_15[2], in_multi_16[2]};
assign multi_15 ={in_multi_13[1], in_multi_14[1], in_multi_15[1], in_multi_16[1]};
assign multi_16 ={in_multi_13[0], in_multi_14[0], in_multi_15[0], in_multi_16[0]};


assign mult_2_out_1={((multi_9[1]^multi_9[2]^multi_9[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_14[1]^multi_14[2]))^multi_14[3]^
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_15[1]^multi_15[2]))^multi_15[3]^
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_16[1]^multi_16[2]))^multi_16[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_15[1]^multi_15[2]))^multi_15[3]^
						((multi_11[1]^multi_11[2]^multi_11[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_11[1]^multi_11[2]^multi_11[3])&(multi_14[1]^multi_14[2]))^multi_14[3]^
						((multi_12[1]^multi_12[2]^multi_12[3])&(multi_13[1]^multi_13[2]))^multi_13[3],
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_15[1]^multi_15[2]))^multi_15[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_14[1]^multi_14[2]))^multi_14[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_16[1]^multi_16[2]))^multi_16[3]^
						((multi_11[1]^multi_11[2]^multi_11[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_12[1]^multi_12[2]^multi_12[3])&(multi_14[1]^multi_14[2]))^multi_14[3],
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_14[1]^multi_14[2]))^multi_14[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_14[1]^multi_14[2]))^multi_14[3]^
						((multi_11[1]^multi_11[2]^multi_11[3])&(multi_15[1]^multi_15[2]))^multi_15[3]^
						((multi_11[1]^multi_11[2]^multi_11[3])&(multi_16[1]^multi_16[2]))^multi_16[3]^
						((multi_12[1]^multi_12[2]^multi_12[3])&(multi_15[1]^multi_15[2]))^multi_15[3],
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_9[1]^multi_9[2]^multi_9[3])&(multi_14[1]^multi_14[2]))^multi_14[3]^
						((multi_10[1]^multi_10[2]^multi_10[3])&(multi_13[1]^multi_13[2]))^multi_13[3]^
						((multi_11[1]^multi_11[2]^multi_11[3])&(multi_15[1]^multi_15[2]))^multi_15[3]^
						((multi_12[1]^multi_12[2]^multi_12[3])&(multi_16[1]^multi_16[2]))^multi_16[3]};
assign mult_2_out_2={((multi_9[0]^multi_9[2])&(multi_13[0]^multi_13[3]))^(multi_9[0]&multi_13[2])^multi_9[3]^
					((multi_9[0]^multi_9[2])&(multi_14[0]^multi_14[3]))^(multi_9[0]&multi_14[2])^multi_9[3]^
					((multi_9[0]^multi_9[2])&(multi_15[0]^multi_15[3]))^(multi_9[0]&multi_15[2])^multi_9[3]^
					((multi_9[0]^multi_9[2])&(multi_16[0]^multi_16[3]))^(multi_9[0]&multi_16[2])^multi_9[3]^
					((multi_10[0]^multi_10[2])&(multi_13[0]^multi_13[3]))^(multi_10[0]&multi_13[2])^multi_10[3]^
					((multi_10[0]^multi_10[2])&(multi_15[0]^multi_15[3]))^(multi_10[0]&multi_15[2])^multi_10[3]^
					((multi_11[0]^multi_11[2])&(multi_13[0]^multi_13[3]))^(multi_11[0]&multi_13[2])^multi_11[3]^
					((multi_11[0]^multi_11[2])&(multi_14[0]^multi_14[3]))^(multi_11[0]&multi_14[2])^multi_11[3]^
					((multi_12[0]^multi_12[2])&(multi_13[0]^multi_13[3]))^(multi_12[0]&multi_13[2])^multi_12[3],
					((multi_9[0]^multi_9[2])&(multi_13[0]^multi_13[3]))^(multi_9[0]&multi_13[2])^multi_9[3]^
					((multi_9[0]^multi_9[2])&(multi_15[0]^multi_15[3]))^(multi_9[0]&multi_15[2])^multi_9[3]^
					((multi_10[0]^multi_10[2])&(multi_14[0]^multi_14[3]))^(multi_10[0]&multi_14[2])^multi_10[3]^
					((multi_10[0]^multi_10[2])&(multi_16[0]^multi_16[3]))^(multi_10[0]&multi_16[2])^multi_10[3]^
					((multi_11[0]^multi_11[2])&(multi_13[0]^multi_13[3]))^(multi_11[0]&multi_13[2])^multi_11[3]^
					((multi_12[0]^multi_12[2])&(multi_14[0]^multi_14[3]))^(multi_12[0]&multi_14[2])^multi_12[3],
					((multi_9[0]^multi_9[2])&(multi_14[0]^multi_14[3]))^(multi_9[0]&multi_14[2])^multi_9[3]^
					((multi_10[0]^multi_10[2])&(multi_13[0]^multi_13[3]))^(multi_10[0]&multi_13[2])^multi_10[3]^
					((multi_10[0]^multi_10[2])&(multi_14[0]^multi_14[3]))^(multi_10[0]&multi_14[2])^multi_10[3]^
					((multi_11[0]^multi_11[2])&(multi_15[0]^multi_15[3]))^(multi_11[0]&multi_15[2])^multi_11[3]^
					((multi_11[0]^multi_11[2])&(multi_16[0]^multi_16[3]))^(multi_11[0]&multi_16[2])^multi_11[3]^
					((multi_12[0]^multi_12[2])&(multi_15[0]^multi_15[3]))^(multi_12[0]&multi_15[2])^multi_12[3],
					((multi_9[0]^multi_9[2])&(multi_13[0]^multi_13[3]))^(multi_9[0]&multi_13[2])^multi_9[3]^
					((multi_9[0]^multi_9[2])&(multi_14[0]^multi_14[3]))^(multi_9[0]&multi_14[2])^multi_9[3]^
					((multi_10[0]^multi_10[2])&(multi_13[0]^multi_13[3]))^(multi_10[0]&multi_13[2])^multi_10[3]^
					((multi_11[0]^multi_11[2])&(multi_15[0]^multi_15[3]))^(multi_11[0]&multi_15[2])^multi_11[3]^
					((multi_12[0]^multi_12[2])&(multi_16[0]^multi_16[3]))^(multi_12[0]&multi_16[2])^multi_12[3]};
				
assign mult_2_out_3={((multi_9[1]^multi_9[3])&(multi_13[0]^multi_13[3]))^(multi_9[0]&multi_13[1])^multi_9[3]^multi_13[3]^
					((multi_9[1]^multi_9[3])&(multi_14[0]^multi_14[3]))^(multi_9[0]&multi_14[1])^multi_9[3]^multi_14[3]^
					((multi_9[1]^multi_9[3])&(multi_15[0]^multi_15[3]))^(multi_9[0]&multi_15[1])^multi_9[3]^multi_15[3]^
					((multi_9[1]^multi_9[3])&(multi_16[0]^multi_16[3]))^(multi_9[0]&multi_16[1])^multi_9[3]^multi_16[3]^
					((multi_10[1]^multi_10[3])&(multi_13[0]^multi_13[3]))^(multi_10[0]&multi_13[1])^multi_10[3]^multi_13[3]^
					((multi_10[1]^multi_10[3])&(multi_15[0]^multi_15[3]))^(multi_10[0]&multi_15[1])^multi_10[3]^multi_15[3]^
					((multi_11[1]^multi_11[3])&(multi_13[0]^multi_13[3]))^(multi_11[0]&multi_13[1])^multi_11[3]^multi_13[3]^
					((multi_11[1]^multi_11[3])&(multi_14[0]^multi_14[3]))^(multi_11[0]&multi_14[1])^multi_11[3]^multi_14[3]^
					((multi_12[1]^multi_12[3])&(multi_13[0]^multi_13[3]))^(multi_12[0]&multi_13[1])^multi_12[3]^multi_13[3],
					((multi_9[1]^multi_9[3])&(multi_13[0]^multi_13[3]))^(multi_9[0]&multi_13[1])^multi_9[3]^multi_13[3]^
					((multi_9[1]^multi_9[3])&(multi_15[0]^multi_15[3]))^(multi_9[0]&multi_15[1])^multi_9[3]^multi_15[3]^
					((multi_10[1]^multi_10[3])&(multi_14[0]^multi_14[3]))^(multi_10[0]&multi_14[1])^multi_10[3]^multi_14[3]^
					((multi_10[1]^multi_10[3])&(multi_16[0]^multi_16[3]))^(multi_10[0]&multi_16[1])^multi_10[3]^multi_16[3]^
					((multi_11[1]^multi_11[3])&(multi_13[0]^multi_13[3]))^(multi_11[0]&multi_13[1])^multi_11[3]^multi_13[3]^
					((multi_12[1]^multi_12[3])&(multi_14[0]^multi_14[3]))^(multi_12[0]&multi_14[1])^multi_12[3]^multi_14[3],
					((multi_9[1]^multi_9[3])&(multi_14[0]^multi_14[3]))^(multi_9[0]&multi_14[1])^multi_9[3]^multi_14[3]^
					((multi_10[1]^multi_10[3])&(multi_13[0]^multi_13[3]))^(multi_10[0]&multi_13[1])^multi_10[3]^multi_13[3]^
					((multi_10[1]^multi_10[3])&(multi_14[0]^multi_14[3]))^(multi_10[0]&multi_14[1])^multi_10[3]^multi_14[3]^
					((multi_11[1]^multi_11[3])&(multi_15[0]^multi_15[3]))^(multi_11[0]&multi_15[1])^multi_11[3]^multi_15[3]^
					((multi_11[1]^multi_11[3])&(multi_16[0]^multi_16[3]))^(multi_11[0]&multi_16[1])^multi_11[3]^multi_16[3]^
					((multi_12[1]^multi_12[3])&(multi_15[0]^multi_15[3]))^(multi_12[0]&multi_15[1])^multi_12[3]^multi_15[3],
					((multi_9[1]^multi_9[3])&(multi_13[0]^multi_13[3]))^(multi_9[0]&multi_13[1])^multi_9[3]^multi_13[3]^
					((multi_9[1]^multi_9[3])&(multi_14[0]^multi_14[3]))^(multi_9[0]&multi_14[1])^multi_9[3]^multi_14[3]^
					((multi_10[1]^multi_10[3])&(multi_13[0]^multi_13[3]))^(multi_10[0]&multi_13[1])^multi_10[3]^multi_13[3]^
					((multi_11[1]^multi_11[3])&(multi_15[0]^multi_15[3]))^(multi_11[0]&multi_15[1])^multi_11[3]^multi_15[3]^
					((multi_12[1]^multi_12[3])&(multi_16[0]^multi_16[3]))^(multi_12[0]&multi_16[1])^multi_12[3]^multi_16[3]};
					
wire [7:0] re_iso_out_1,re_iso_out_2,re_iso_out_3;
REVERSE_ISOMORPHISM re_iso_1(.data_in({mult_1_out_1,mult_2_out_1}),.data_out(re_iso_out_1));
REVERSE_ISOMORPHISM re_iso_2(.data_in({mult_1_out_2,mult_2_out_2}),.data_out(re_iso_out_2));
REVERSE_ISOMORPHISM re_iso_3(.data_in({mult_1_out_3,mult_2_out_3}),.data_out(re_iso_out_3));

AFFINE affine_1(.data_in(re_iso_out_1),.data_out(data_out_1));
AFFINE_1 affine_2(.data_in(re_iso_out_2),.data_out(data_out_2));
AFFINE_1 affine_3(.data_in(re_iso_out_3),.data_out(data_out_3));
endmodule
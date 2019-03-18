`timescale 1ns / 1ps

module Gamma_Secured (
    input  wire [127 : 0] data_i_1,
	 input  wire [127 : 0] data_i_2,
	 input  wire [127 : 0] data_i_3,
	 input  wire [127 : 0] data_i_4,
	 input  wire [19 : 0] random_bytes,
    output wire [127 : 0] data_o_1,
	 output wire [127 : 0] data_o_2,
	 output wire [127 : 0] data_o_3
);
 
genvar i;
 
generate
    for (i = 0; i < 16; i = i+1)
    begin : sboxes
		  Masked_SubBytes sub(.data_in_1(data_i_1[i*8+7 : i*8]),.data_in_2(data_i_2[i*8+7 : i*8]),.data_in_3(data_i_3[i*8+7 : i*8]),.data_in_4(data_i_4[i*8+7 : i*8]),.random(random_bytes),.data_out_1(data_o_1[i*8+7 : i*8]),.data_out_2(data_o_2[i*8+7 : i*8]),.data_out_3(data_o_3[i*8+7 : i*8]));
    end
endgenerate

endmodule


`timescale 1ns / 1ps

module Gamma (
    input  wire [127 : 0] data_i,
    output wire [127 : 0] data_o
);
 
genvar i;
 
generate
    for (i = 0; i < 16; i = i+1)
    begin : sboxes
        Sbox s16 (.data_out(data_o[i*8+7 : i*8]),.data_in(data_i[i*8+7 : i*8]));    
    end
endgenerate

endmodule
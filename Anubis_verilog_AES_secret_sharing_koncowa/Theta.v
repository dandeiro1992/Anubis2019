`timescale 1ns / 1ps

module Theta (
    input  wire [127 : 0] data_in,
    output wire [127 : 0] data_out
);
 
genvar i;
 
generate
    for (i = 0; i < 4; i = i+1)
    begin : thetas
        Multiplication m4 (.data_out(data_out[i*32+31 : i*32]),.data_in(data_in[i*32+31 : i*32]));    
    end
endgenerate

endmodule
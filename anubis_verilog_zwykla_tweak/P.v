`timescale 1ns / 1ps

module P (
    input  wire[3 : 0] data_in,
    output reg[3 : 0] data_out
);
 
always @(data_in)
    case (data_in)
		4'h0 : data_out = 4'h3;
		4'h1 : data_out = 4'hF;
		4'h2 : data_out = 4'he;
		4'h3 : data_out = 4'h0;
		4'h4 : data_out = 4'h5;
		4'h5 : data_out = 4'h4;
		4'h6 : data_out = 4'hb;
		4'h7 : data_out = 4'hc;
		4'h8 : data_out = 4'hd;
		4'h9 : data_out = 4'ha;
		4'ha : data_out = 4'h9;
		4'hb : data_out = 4'h6;
		4'hc : data_out = 4'h7;
		4'hd : data_out = 4'h8;
		4'he : data_out = 4'h2;
		4'hf : data_out = 4'h1;
        default : data_out = 4'h00;
    endcase 

endmodule
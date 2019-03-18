`timescale 1ns / 1ps

module Add_Round_Key (
    input  wire [127 : 0] data_in,
	 input  wire [127 : 0] round_key,
    output wire [127 : 0] data_out
);
 
assign data_out=data_in^round_key;

endmodule
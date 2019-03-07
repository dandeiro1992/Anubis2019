`timescale 1ns / 1ps

module Add_Round_Constants (
    input  wire [127 : 0] data_in,
	 input  wire [127 : 0] round_constants,
    output wire [127 : 0] data_out
);
 
assign data_out=data_in^round_constants;

endmodule
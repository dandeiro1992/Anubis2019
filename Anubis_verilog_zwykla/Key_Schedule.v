`timescale 1ns / 1ps

module Key_Schedule (
    input  wire[127 : 0] data_in,
    input  wire[  3 : 0] round_counter,
    output wire[127 : 0] data_out
);
 
wire [127:0] tmp_1;
wire [127:0] tmp_2;
wire [127:0] tmp_3; 
wire [127:0] tmp_4; 

Round_Constants round_constants (.round_counter(round_counter),.data_out(tmp_1));
Psi psi (.data_in(data_in),.round_constants(tmp_1),.data_out(tmp_2));

assign data_out=((round_counter[3:0])==4'b0)?(data_in):(tmp_2);
endmodule

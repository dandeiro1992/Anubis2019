`timescale 1ns / 1ps

module Round_Constants (
    input  wire[  3 : 0] round_counter,
    output wire[127 : 0] data_out
);
wire [7:0] tmp;
assign tmp={4'h0,round_counter[3:0]};

Sbox s_1 (.data_out(data_out[127:120]),.data_in(4*(tmp[7:0]-8'b00000001)));    
Sbox s_2 (.data_out(data_out[119:112]),.data_in(4*(tmp-4'b0001)+4'b0001));   
Sbox s_3 (.data_out(data_out[111:104]),.data_in(4*(tmp-4'b0001)+4'b0010));   
Sbox s_4 (.data_out(data_out[103:96]),.data_in(4*(tmp-4'b0001)+4'b0011));
assign data_out[95:0]=96'h000000000000000000000000;

endmodule
`timescale 1ns / 1ps
module Theta_tb;
   reg [127:0] wejscie;
   wire [127:0] wyjscie; 

Theta teta (.data_out(wyjscie),.data_in(wejscie));    


initial 
begin
wejscie[127:0]=128'hdb1353450102030405060708090a0b0c;
#10
wejscie[127:0]=128'hf20a225c0102030405060708090a0b0c;
end
endmodule
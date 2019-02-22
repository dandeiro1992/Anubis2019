`timescale 1ns / 1ps
module Omega_tb;
   reg [127:0] wejscie;
   wire [127:0] wyjscie; 

Omega o (.data_out(wyjscie),.data_in(wejscie));    


initial 
begin
wejscie[127:0]=128'h01010101010101010101010101010101;
#10
wejscie[127:0]=128'h01000000000000000000000000000000;
#10
wejscie[127:0]=128'h00000000000000000000000000000001;
#10
wejscie[127:0]=128'hdb1353450102030405060708090a0b0c;
#10
wejscie[127:0]=128'hf20a225c0102030405060708090a0b0c;
end
endmodule
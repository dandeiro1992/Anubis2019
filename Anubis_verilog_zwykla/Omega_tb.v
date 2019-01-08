`timescale 1ns / 1ps
module Omega_tb;
   reg [127:0] wejscie;
   wire [127:0] wyjscie; 

Omega o (.data_out(wyjscie),.data_in(wejscie));    


initial 
begin
wejscie[127:0]=128'h01000000000000000000000000000000;
#10
wejscie[127:0]=128'h00000000000000000000000000000001;
end
endmodule
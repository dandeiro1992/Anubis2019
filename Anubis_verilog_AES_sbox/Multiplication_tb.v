`timescale 1ns / 1ps
module Multiplication_tb;
   reg [127:0] wejscie;
   wire [127:0] wyjscie; 

Multiplication multiplication (.data_out(wyjscie),.data_in(wejscie));    


initial 
begin
wejscie[31:0]=32'hdb135345;
#10
wejscie[31:0]=32'hf20a225c;
end
endmodule
`timescale 1ns / 1ps
module multiplication_tb;
   reg [31:0] wejscie;
   wire [31:0] wyjscie; 

Multiplication m (.data_out(wyjscie),.data_in(wejscie));    


initial 
begin
wejscie[31:0]=32'hdb135345;
#10
wejscie[31:0]=32'hf20a225c;
end
endmodule
`timescale 1ns / 1ps
module Fi_tb;
   reg [127:0] wejscie;
   wire [127:0] wyjscie; 

Fi fi (.data_out(wyjscie),.data_in(wejscie));    


initial 
begin
wejscie[127:0]=128'h00000000000000000000000000000000;
#10
wejscie[127:0]=128'h00000000000000000000000000000001;
#10
wejscie[127:0]=128'h00000000000000000000000000000002;
#10
wejscie[127:0]=128'h00000000000000000000000000000003;

end
endmodule
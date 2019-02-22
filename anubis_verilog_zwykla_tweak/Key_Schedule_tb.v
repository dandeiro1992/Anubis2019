`timescale 1ns / 1ps
module Key_Schedule_tb;
   reg [127:0] wejscie;
	reg [3:0] round_counter;
   wire [127:0] wyjscie; 

Key_Schedule klucz (.data_out(wyjscie),.data_in(wejscie),.round_counter(round_counter));    


initial 
begin
round_counter=4'h1;
wejscie[127:0]=128'h80000000000000000000000000000000;
#10
round_counter=4'h2;
wejscie[127:0]=128'h7c8cacc3a7a7a7a7a7a7a7a7a7a7a7a7;
#10
round_counter=4'h2;
wejscie[127:0]=128'h4040404010101010050505054a4a4a4a;
#10
wejscie[127:0]=128'hdb1353450102030405060708090a0b0c;
#10
wejscie[127:0]=128'hf20a225c0102030405060708090a0b0c;
end
endmodule


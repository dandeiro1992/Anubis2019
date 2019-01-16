`timescale 1ns / 1ps

module Anubis_2 (
    input  [127 : 0] data_in,                // plaintext or master key, depends on key_load and data_load
    input clk,                              // clock
    input reset,                            // reset
    input [   1 : 0] order,                 // 00 - load key, 01 - load plaintext, 01 - start encryption
    output reg [127 : 0] data_out             // ciphertext
);
reg  [3 : 0] state;                         // current state
reg  [3 : 0] nextstate;                     // next state
reg  [3 : 0] round_counter;            // round counter, differs from original one cause round key is calculated during encryption
reg  [127 : 0] key;                         // register to store master key at the beggining
wire  [127 : 0] round_key;                   // register to store acual round key
reg  [127 : 0] data;    							//register to store data;

wire [127 : 0] gamma_i;                       // input to Sub_Bytes
wire [127 : 0] gamma_o;                       // output from Sub_Bytes
wire [127 : 0] tau_i;                     // input to Shift_Rows
wire [127 : 0] tau_o; 						  // input from Shift_Rows
wire [127 : 0] theta_i;                       // input to Mix_Columns
wire [127 : 0] theta_o;                       // output from Mix_Columns
wire [127 : 0] key_update_output;           // output from key schedule algorithm


//used modules
Gamma sub(.data_i(gamma_i),.data_o(gamma_o));
Tau shift (.data_in(gamma_o),.data_out(tau_o));
Theta mix(.data_in(tau_o),.data_out(theta_o));

Key_Schedule key_update(.data_in(round_key),.round_counter(round_counter),.data_out(key_update_output));


assign gamma_i=data^key_update_output;
assign round_key=key;

parameter idle=0,load_data=1,encrypt=2,result=3;

always@(posedge clk)
begin
if(reset)
	state<=idle;
else
	state<=nextstate;
end

always@(posedge clk)
begin
	case(state)
	idle:
		begin
		round_counter=4'h0;
		if(order==2'b00)
		begin
			nextstate<=load_data;
		end
		else if(order==2'b01)
		begin
			nextstate<=load_data;
		end
		end
	load_data:
		if(order==2'b00)
		begin
			key<=data_in;
			nextstate<=load_data;
		end
		else if(order==2'b01)
		begin
			data=data_in;
			nextstate=encrypt;
		end
	encrypt:
		if((order!=2'b00)&&(order!=2'b01))
		begin
			if(round_counter<4'hc)
			begin
//				if(round_counter==4'h1)
//				begin
//				key<=key_update_output;
//				data<=gamma_i^key_update_output;
//				round_counter<=round_counter+4'h1;
//				nextstate<=encrypt;
//				end
//				else
//				begin
				key<=key_update_output;
				data<=theta_o;//^key_update_output;
				round_counter<=round_counter+4'h1;
				nextstate<=encrypt;
//				end
			end
			else
			begin
				nextstate<=result;
			end
		end	
	result:
		data_out<=tau_o^key_update_output;//^round_key;
	default:
		nextstate<=idle;
	endcase
end

endmodule
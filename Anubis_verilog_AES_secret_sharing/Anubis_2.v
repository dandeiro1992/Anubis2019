`timescale 1ns / 1ps

module Anubis_2 (
    input  [127 : 0] data_in,                // plaintext or master key, depends on key_load and data_load
    input clk,                              // clock
    input reset,                            // reset
    input [   1 : 0] order,                 // 00 - load key, 01 - load plaintext, 01 - start encryption
	 input [127 : 0] random_2,
	 input [127 : 0] random_22,
	 input [127 : 0] random_4,
	 input [127 : 0] random_44,
	 input [127 : 0] random_6,
	 input [19:0] random,
    output reg [127 : 0] data_out             // ciphertext
);
reg  [3 : 0] state;                         // current state
reg  [3 : 0] nextstate;                     // next state
reg  [3 : 0] round_counter;            // round counter, differs from original one cause round key is calculated during encryption
reg  [127 : 0] key;                         // register to store master key at the beggining
wire  [127 : 0] round_key;                   // register to store acual round key
//reg  [127 : 0] data;    							//register to store data;

reg  [127 : 0] data_1;    							//register to store data;
reg  [127 : 0] data_2;    							//register to store data;
reg  [127 : 0] data_3;    							//register to store data;

//wire [127 : 0] gamma_i;                       // input to Sub_Bytes
wire [127 : 0] gamma_i_1;                       // input to Sub_Bytes
wire [127 : 0] gamma_i_2;                       // input to Sub_Bytes
wire [127 : 0] gamma_i_3;                       // input to Sub_Bytes
wire [127 : 0] gamma_i_4;                       // input to Sub_Bytes

//wire [127 : 0] gamma_o;                       // output from Sub_Bytes
wire [127 : 0] gamma_o_1;                       // output from Sub_Bytes
wire [127 : 0] gamma_o_2;                       // output from Sub_Bytes
wire [127 : 0] gamma_o_3;                       // output from Sub_Bytes

//wire [127 : 0] tau_i;                     // input to Shift_Rows
wire [127 : 0] tau_i_1;                     // input to Shift_Rows
wire [127 : 0] tau_i_2;                     // input to Shift_Rows
wire [127 : 0] tau_i_3;                     // input to Shift_Rows

//wire [127 : 0] tau_o; 						  // input from Shift_Rows
wire [127 : 0] tau_o_1; 						  // input from Shift_Rows
wire [127 : 0] tau_o_2; 						  // input from Shift_Rows
wire [127 : 0] tau_o_3; 						  // input from Shift_Rows

//wire [127 : 0] theta_i;                       // input to Mix_Columns
wire [127 : 0] theta_i_1;                       // input to Mix_Columns
wire [127 : 0] theta_i_2;                       // input to Mix_Columns
wire [127 : 0] theta_i_3;                       // input to Mix_Columns

//wire [127 : 0] theta_o;                       // output from Mix_Columns
wire [127 : 0] theta_o_1;                       // output from Mix_Columns
wire [127 : 0] theta_o_2;                       // output from Mix_Columns
wire [127 : 0] theta_o_3;                       // output from Mix_Columns
wire [127 : 0] key_update_output;           // output from key schedule algorithm
wire [127 : 0] key_update_output_tmp;           // output from key schedule algorithm
reg [127 : 0] tmp;  
//used modules
//Gamma sub(.data_i(gamma_i),.data_o(gamma_o));
//Tau shift (.data_in(gamma_o),.data_out(tau_o));
//Theta mix(.data_in(tau_o),.data_out(theta_o));

Gamma_Secured sub(.data_i_1(gamma_i_1),.data_i_2(gamma_i_2),.data_i_3(gamma_i_3),.data_i_4(gamma_i_4),
							 .random_bytes(random),.data_o_1(gamma_o_1),.data_o_2(gamma_o_2),.data_o_3(gamma_o_3));

		
Tau shift_1 (.data_in(gamma_o_1),.data_out(tau_o_1));
Tau shift_2 (.data_in(gamma_o_2),.data_out(tau_o_2));
Tau shift_3 (.data_in(gamma_o_3),.data_out(tau_o_3));

Theta mix_1(.data_in(tau_o_1),.data_out(theta_o_1));
Theta mix_2(.data_in(tau_o_2),.data_out(theta_o_2));
Theta mix_3(.data_in(tau_o_3),.data_out(theta_o_3));
		
Fi fi (.data_in(key_update_output_tmp),.data_out(key_update_output));

Key_Schedule key_update(.data_in(round_key),.round_counter(round_counter),.data_out(key_update_output_tmp));


assign gamma_i_1=data_1;
assign gamma_i_2=data_2;
assign gamma_i_3=random_6;
assign gamma_i_4=data_3;
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
if(round_counter<4'hd)
begin
	tmp<=tau_o_1^tau_o_2^tau_o_3;
end
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
			data_1=data_in^random_2^random_22^key_update_output^random_4^random_44;
			data_2=data_in^random_22^key_update_output^random_4^gamma_i_3;
			data_3=data_in^random_2^key_update_output^random_44;
			nextstate=encrypt;
		end
	encrypt:
		if((order!=2'b00)&&(order!=2'b01))
		begin
			if(round_counter<4'hc)
			begin
				if(round_counter==4'h0)
				begin
				key<=key_update_output_tmp;
//				data_1<=gamma_i_1^random_4^random_44;
//				data_2<=gamma_i_2^random_4^gamma_i_3;
//				data_3<=gamma_i_4^random_44;
				round_counter<=round_counter+4'h1;
				nextstate<=encrypt;
				end
				else
				begin
				key<=key_update_output_tmp;
				data_1<=theta_o_1^key_update_output^random_4^random_44^random_2^random_22;
				data_2<=theta_o_2^key_update_output^random_4^gamma_i_3^random_22;
				data_3<=theta_o_3^key_update_output^random_44^random_2;
				round_counter<=round_counter+4'h1;
				nextstate<=encrypt;
				end
			end
			else
			begin
				nextstate<=result;
			end
		end	
	result:
	begin
		data_out<=tmp^key_update_output;//^round_key;
		nextstate<=idle;
	end
	default:
		nextstate<=idle;
	endcase
end

endmodule
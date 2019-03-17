`timescale 1ns / 1ps

module Anubis_2 (
    input  [127 : 0] data_in,                // plaintext or master key, depends on key_load and data_load
    input clk,                              // clock
    input reset,                            // reset
    input [   1 : 0] order,                 // 00 - load key, 01 - load plaintext, 01 - start encryption
    output reg [127 : 0] data_out,             // ciphertext
	 output reg [127 : 0] data_out_1,            // ciphertext
	  output reg [127 : 0] data_out_n,             // ciphertext
	 output reg [127 : 0] data_out_1_n  
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
wire [127 : 0] key_update_output_tmp;           // output from key schedule algorithm
reg [127 : 0] tmp;  


/////////////////////////
///// negative/////////
////////////////////////
reg  [3 : 0] state_n;                         // current state
reg  [3 : 0] nextstate_n;                     // next state
reg  [3 : 0] round_counter_n;            // round counter, differs from original one cause round key is calculated during encryption
reg  [127 : 0] key_n;   
reg  [127 : 0] data_n;  

  
//used modules
Gamma sub(.data_i(gamma_i),.data_o(gamma_o));
Tau shift (.data_in(gamma_o),.data_out(tau_o));
Theta mix(.data_in(tau_o),.data_out(theta_o));

Fi fi (.data_in(key_update_output_tmp),.data_out(key_update_output));

Key_Schedule key_update(.data_in(round_key),.round_counter(round_counter),.data_out(key_update_output_tmp));


assign gamma_i=data^key_update_output;
assign round_key=key;

parameter idle=0,load_data=1,encrypt=2,result=3;

always@(posedge clk)
begin
if(reset)
	begin
	state<=idle;
	state_n<=~idle;
	end
else
	begin
	state<=nextstate;
	state_n<=~nextstate;
	end
end

always@(posedge clk)
begin
if(round_counter<4'hc)
begin
	tmp<=tau_o;
end
end


always@(posedge clk)
begin
	case(state)
	idle:
		begin
		round_counter=4'h0;
		round_counter_n=4'hf;
		if(order==2'b00)
		begin
			nextstate<=load_data;
			nextstate_n<=~load_data;
		end
		else if(order==2'b01)
		begin
			nextstate<=load_data;
			nextstate_n<=~load_data;
		end
		end
	load_data:
		if(order==2'b00)
		begin
			key<=data_in;
			key_n<=~data_in;
			nextstate<=load_data;
			nextstate_n<=~load_data;
		end
		else if(order==2'b01)
		begin
			data=data_in;
			nextstate=encrypt;
			data_n=~data_in;
			nextstate_n=~encrypt;
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
				key<=key_update_output_tmp;
				data<=theta_o;//^key_update_output;
				round_counter<=round_counter+4'h1;
				nextstate<=encrypt;
				
				key_n<=~key_update_output_tmp;
				data_n<=~theta_o;//^key_update_output;
				round_counter_n<=~(round_counter+4'h1);
				nextstate_n<=~encrypt;
//				end
			end
			else
			begin
				nextstate<=result;
				nextstate_n<=~result;
			end
		end	
	result:
	begin
		data_out<=tmp^key_update_output;//^round_key;
		nextstate<=idle;
		data_out_n<=~(tmp^key_update_output);//^round_key;
		nextstate_n<=~idle;
	end
	default:
		begin
		nextstate<=idle;
		nextstate_n<=~idle;
		end
	endcase
end


///////////////////////////////////////////////////////////////////////////////
//////////// zbocze opadające /////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
reg  [3 : 0] state_1;                         // current state
reg  [3 : 0] nextstate_1;                     // next state
reg  [3 : 0] round_counter_1;            // round counter, differs from original one cause round key is calculated during encryption
reg  [127 : 0] key_1;                         // register to store master key at the beggining
wire  [127 : 0] round_key_1;                   // register to store acual round key
reg  [127 : 0] data_1;    							//register to store data;

wire [127 : 0] gamma_i_1;                       // input to Sub_Bytes
wire [127 : 0] gamma_o_1;                       // output from Sub_Bytes
wire [127 : 0] tau_i_1;                     // input to Shift_Rows
wire [127 : 0] tau_o_1; 						  // input from Shift_Rows
wire [127 : 0] theta_i_1;                       // input to Mix_Columns
wire [127 : 0] theta_o_1;                       // output from Mix_Columns
wire [127 : 0] key_update_output_1;           // output from key schedule algorithm
wire [127 : 0] key_update_output_tmp_1;           // output from key schedule algorithm
reg [127 : 0] tmp_1;

  
  
 /////////////////////////
///// negative/////////
////////////////////////
reg  [3 : 0] state_1_n;                         // current state
reg  [3 : 0] nextstate_1_n;                     // next state
reg  [3 : 0] round_counter_1_n;            // round counter, differs from original one cause round key is calculated during encryption
reg  [127 : 0] key_1_n;   
reg  [127 : 0] data_1_n;  


//used modules
Gamma sub_1(.data_i(gamma_i_1),.data_o(gamma_o_1));
Tau shift_1 (.data_in(gamma_o_1),.data_out(tau_o_1));
Theta mix_1(.data_in(tau_o_1),.data_out(theta_o_1));

Fi fi_1 (.data_in(key_update_output_tmp_1),.data_out(key_update_output_1));

Key_Schedule key_update_1(.data_in(round_key_1),.round_counter(round_counter_1),.data_out(key_update_output_tmp_1));


assign gamma_i_1=data_1^key_update_output_1;
assign round_key_1=key_1;

parameter idle_1=0,load_data_1=1,encrypt_1=2,result_1=3;

always@(negedge clk)
begin
if(reset)
	begin
	state_1<=idle_1;
	state_1_n<=~idle_1;
	end
else
	begin
	state_1<=nextstate_1;
	state_1_n<=~idle_1;
	end
end

always@(negedge clk)
begin
if(round_counter_1<4'hc)
begin
	tmp_1<=tau_o_1;
end
end


always@(negedge clk)
begin
	case(state_1)
	idle_1:
		begin
		round_counter_1=4'h0;
		round_counter_1_n=4'hf;
		if(order==2'b00)
		begin
			nextstate_1<=load_data_1;
			nextstate_1_n<=~load_data_1;
		end
		else if(order==2'b01)
		begin
			nextstate_1<=load_data_1;
			nextstate_1_n<=~load_data_1;
		end
		end
	load_data_1:
		if(order==2'b00)
		begin
			key_1<=~data_in;
			nextstate_1<=load_data_1;
			key_1_n<=data_in;
			nextstate_1_n<=~load_data_1;
		end
		else if(order==2'b01)
		begin
			data_1=~data_in;
			nextstate_1=encrypt_1;
			data_1_n=data_in;
			nextstate_1_n=~encrypt_1;
		end
	encrypt_1:
		if((order!=2'b00)&&(order!=2'b01))
		begin
			if(round_counter_1<4'hc)
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
				key_1<=key_update_output_tmp_1;
				data_1<=theta_o_1;//^key_update_output;
				round_counter_1<=round_counter_1+4'h1;
				nextstate_1<=encrypt_1;
				
				key_1_n<=~key_update_output_tmp_1;
				data_1_n<=~theta_o_1;//^key_update_output;
				round_counter_1_n<=~(round_counter_1+4'h1);
				nextstate_1_n<=~encrypt_1;
//				end
			end
			else
			begin
				nextstate_1<=result_1;
				nextstate_1_n<=~result_1;
			end
		end	
	result_1:
	begin
		data_out_1<=tmp_1^key_update_output_1;//^round_key;
		nextstate_1<=idle_1;
		data_out_1_n<=~(tmp_1^key_update_output_1);//^round_key;
		nextstate_1_n<=~idle_1;
	end
	default:
		begin
		nextstate_1<=idle_1;
		nextstate_1_n<=~idle_1;
		end
	endcase
end

endmodule
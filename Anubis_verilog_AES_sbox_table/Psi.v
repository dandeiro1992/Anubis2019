module Psi (
    input  wire [127 : 0] data_in,
	 input  wire [127 : 0] round_constants,
    output wire [127 : 0] data_out
);
wire [127:0] tmp_1;
wire [127:0] tmp_2;
wire [127:0] tmp_3;
Gamma gamma(.data_o(tmp_1),.data_i(data_in));
Pi pi(.data_out(tmp_2),.data_in(tmp_1));
Theta theta(.data_out(tmp_3),.data_in(tmp_2));
Add_Round_Constants add(.data_out(data_out),.data_in(tmp_3),.round_constants(round_constants));

endmodule
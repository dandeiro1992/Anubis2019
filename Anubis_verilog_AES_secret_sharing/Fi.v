module Fi (
    input  wire [127 : 0] data_in,
    output wire [127 : 0] data_out
);
wire [127:0] tmp_1;
wire [127:0] tmp_2;

Gamma gamma(.data_o(tmp_1),.data_i(data_in));
Omega omega(.data_out(tmp_2),.data_in(tmp_1));
Tau tau(.data_out(data_out),.data_in(tmp_2));

endmodule
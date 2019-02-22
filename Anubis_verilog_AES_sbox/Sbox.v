module Sbox (
    input  wire [7 : 0] data_in,
    output wire [7 : 0] data_out
);
wire [7:0] temp_1,temp_17;
wire [3:0] temp_2,temp_3,temp_4,temp_5,temp_14,temp_15,temp_16,temp_44;
wire [1:0] temp_6,temp_7,temp_8,temp_9,temp_10,temp_11,temp_12,temp_13;
ISOMORPHISM iso(.data_in(data_in),.data_out(temp_1));

XSQUARE one(.data_in(temp_1[7:4]),.data_out(temp_2));
XLAMBDA two(.data_in(temp_2),.data_out(temp_3));
assign temp_4=temp_1[7:4]^temp_1[3:0];
XX nine(.data_in({temp_4,temp_1[3:0]}),.data_out(temp_44));
assign temp_5=temp_3^temp_44;
assign temp_6[1]=temp_5[3];
assign temp_6[0]=temp_5[3]^temp_5[2];
XFI three(.data_in(temp_6),.data_out(temp_7));
assign temp_8=temp_5[3:2]^temp_5[1:0];
X four(.data_in({temp_8,temp_5[1:0]}),.data_out(temp_9));
assign temp_10=temp_9^temp_7;
assign temp_11={(((temp_10[1]^temp_10[0])&temp_10[0])^temp_10[1])&temp_10[1],(((temp_10[1]^temp_10[0])&temp_10[0])^temp_10[1])&(temp_10[1]^temp_10[0])};
X five(.data_in({temp_5[3:2],temp_11}),.data_out(temp_12));
X six(.data_in({temp_8,temp_11}),.data_out(temp_13));
assign temp_14={temp_12,temp_13};
XX seven(.data_in({temp_1[7:4],temp_14}),.data_out(temp_15));
XX eight(.data_in({temp_4,temp_14}),.data_out(temp_16));
REVERSE_ISOMORPHISM ten(.data_in({temp_15,temp_16}),.data_out(temp_17));
AFFINE eleven(.data_in(temp_17),.data_out(data_out));
endmodule
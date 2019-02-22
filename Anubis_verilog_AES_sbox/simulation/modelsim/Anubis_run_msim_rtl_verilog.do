transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Theta.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Tau.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Sbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Pi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Multiplication.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Gamma.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Omega.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Round_Constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Key_Schedule.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Fi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Add_Round_Constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Psi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Anubis_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Xsquare.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Xlambda.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Xx.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/X.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Xfi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Isomorphism.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Affine.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_sbox/Reverse_isomorphism.v}


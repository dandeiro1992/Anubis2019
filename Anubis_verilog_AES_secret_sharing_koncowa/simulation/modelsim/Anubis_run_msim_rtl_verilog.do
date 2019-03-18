transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Theta.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Tau.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Sbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Pi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Multiplication.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Gamma.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Omega.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Round_Constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Key_Schedule.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Fi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Add_Round_Constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Psi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Anubis_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Xsquare.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Xlambda.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Xx.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/X.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Xfi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Isomorphism.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Affine.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Reverse_isomorphism.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Masked_SubBytes.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Gamma_Secured.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Inverter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa {C:/Users/Damian/Documents/GitHub/Anubis2019/Anubis_verilog_AES_secret_sharing_koncowa/Affine_1.v}


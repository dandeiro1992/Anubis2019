transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Theta.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Tau.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Sbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Pi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Multiplication.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Gamma.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Omega.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Round_Constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Key_Schedule.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Fi.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Add_Round_Constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla {C:/Users/Damian/Desktop/Anubis2019/Anubis_verilog_zwykla/Psi.v}


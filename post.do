vsim work.postscaler

add wave -position end  sim:/postscaler/Fin
add wave -position end  sim:/postscaler/Rst
add wave -position end  sim:/postscaler/En
add wave -position end  sim:/postscaler/K
add wave -position end  sim:/postscaler/OVF
add wave -position end  sim:/postscaler/Cnt_Ovf
add wave -position end  sim:/postscaler/temp
add wave -position end  sim:/postscaler/Cnt_Out
add wave -position end  sim:/postscaler/reset
add wave -position end  sim:/postscaler/counter/data
add wave -position end  sim:/postscaler/counter/q
add wave -position end  sim:/postscaler/counter/OVF
force -freeze sim:/postscaler/Fin 1 0, 0 {50 ps} -r 100
force -freeze sim:/postscaler/Rst 1 0
force -freeze sim:/postscaler/En 1 0
run

force -freeze sim:/postscaler/Rst 0 0
force -freeze sim:/postscaler/K 010 0
run

run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run



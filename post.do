vsim work.postscaler
# vsim work.postscaler 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading ieee.numeric_bit(body)
# Loading work.postscaler(post)
# Loading work.counter1(beh)
add wave -position end  sim:/postscaler/Fin
add wave -position end  sim:/postscaler/Rst
add wave -position end  sim:/postscaler/En
add wave -position end  sim:/postscaler/K
add wave -position end  sim:/postscaler/OVF
add wave -position end  sim:/postscaler/Cnt_Ovf
add wave -position end  sim:/postscaler/temp
add wave -position end  sim:/postscaler/reset
#add wave -position end  sim:/postscaler/Q
force -freeze sim:/postscaler/Fin 1 0, 0 {100 ps} -r 200
force -freeze sim:/postscaler/Rst 1 0
force -freeze sim:/postscaler/K 001 0
run

force -freeze sim:/postscaler/Rst 0 0
force -freeze sim:/postscaler/En 1 0
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
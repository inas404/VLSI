vsim work.prescaler
# vsim work.prescaler 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading ieee.numeric_bit(body)
# Loading work.prescaler(pre)
# Loading work.updff(behavioral)
# Loading work.my_dff(a_my_dff)
add wave -position end  sim:/prescaler/Fin
add wave -position end  sim:/prescaler/Rst
add wave -position end  sim:/prescaler/En
add wave -position end  sim:/prescaler/K
add wave -position end  sim:/prescaler/Fout
add wave -position end  sim:/prescaler/Q
add wave -position end  sim:/prescaler/org
add wave -position end  sim:/prescaler/Y
force -freeze sim:/prescaler/Fin 1 0, 0 {50 ps} -r 100
force -freeze sim:/prescaler/Rst 1 0
force -freeze sim:/prescaler/K 001 0
run
force -freeze sim:/prescaler/Rst 0 0
force -freeze sim:/prescaler/En 1 0
run
run
run
run
run

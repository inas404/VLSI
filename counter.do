vsim work.updff
# vsim work.updff 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.updff(behavioral)
# Loading work.my_dff(a_my_dff)
add wave -position end  sim:/updff/en
add wave -position end  sim:/updff/rst
add wave -position end  sim:/updff/clk
add wave -position end  sim:/updff/data
add wave -position end  sim:/updff/q
add wave -position end  sim:/updff/OVF
force -freeze sim:/updff/en 1 0
force -freeze sim:/updff/rst 1 0
force -freeze sim:/updff/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/updff/data 4 0
run
force -freeze sim:/updff/rst 0 0
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
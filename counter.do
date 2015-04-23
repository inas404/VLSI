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
add wave -position end  sim:/updff/en2
add wave -position end  sim:/updff/rst
add wave -position end  sim:/updff/clk
add wave -position end  sim:/updff/data
add wave -position end  sim:/updff/q
add wave -position end  sim:/updff/OVF
add wave -position end  sim:/updff/enable_all
add wave -position end  sim:/updff/q_sig
add wave -position end  sim:/updff/q_sigb
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
# 
#           File in use by: Inas  Hostname: INAS-PC  ProcessID: 6044
# 
#           Attempting to use alternate WLF file "./wlftm79mcg".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
# 
#           Using alternate file: ./wlftm79mcg
# 
force -freeze sim:/updff/en 0 0
force -freeze sim:/updff/en2 1 0
force -freeze sim:/updff/rst 1 0
force -freeze sim:/updff/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/updff/data 250 0
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /updff
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /updff
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
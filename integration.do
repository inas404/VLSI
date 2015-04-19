vsim work.integration
# vsim work.integration 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.integration(arch_integration)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.timer0(arch_timer0)
# Loading work.dff(arch_dff)
# Loading ieee.numeric_std(body)
# Loading work.counter0(arch_counter0)
# Loading work.tri_state_buffer(arch)
# Loading ieee.numeric_bit(body)
# Loading work.timer1(data_flow)
# Loading work.prescaler(pre)
# Loading work.counter1(beh)
# Loading work.postscaler(post)
# Loading ieee.math_real(body)
# Loading work.pwm(pwm_arch)
# Loading work.gpio(my_gpio)
# Loading work.my_ndff(a_my_ndff)
# Loading work.my_dff(a_my_dff)
# Loading work.mux2(data_flow)
add wave -position end  sim:/integration/Add_Bus
add wave -position end  sim:/integration/Data_Bus
add wave -position end  sim:/integration/Enable
add wave -position end  sim:/integration/Clk
add wave -position end  sim:/integration/Ex_Clk
add wave -position end  sim:/integration/R_W
add wave -position end  sim:/integration/Rst
add wave -position end  sim:/integration/Ovf0
add wave -position end  sim:/integration/Ovf1
add wave -position end  sim:/integration/V2
add wave -position end  sim:/integration/Enable_Bus
add wave -position end  sim:/integration/U1/Add_Bus
add wave -position end  sim:/integration/U1/Data_Bus
add wave -position end  sim:/integration/U1/Enable_Bus
add wave -position end  sim:/integration/U1/En
add wave -position end  sim:/integration/U1/Clk
add wave -position end  sim:/integration/U1/R_W
add wave -position end  sim:/integration/U1/Rst
add wave -position end  sim:/integration/U1/Ovf
add wave -position end  sim:/integration/U1/Data1
add wave -position end  sim:/integration/U1/Data2
add wave -position end  sim:/integration/U1/Data12
add wave -position end  sim:/integration/U1/Control
add wave -position end  sim:/integration/U1/Fout_Pre
add wave -position end  sim:/integration/U1/Count_Ovf
add wave -position end  sim:/integration/U1/Pre_Mode
add wave -position end  sim:/integration/U1/Post_Mode
force -freeze sim:/integration/Add_Bus 01000000 0
force -freeze sim:/integration/Data_Bus 00000000 0
force -freeze sim:/integration/Enable 1 0
force -freeze sim:/integration/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/integration/Ex_Clk 1 0, 0 {100 ps} -r 200
force -freeze sim:/integration/R_W 0 0
force -freeze sim:/integration/Rst 1 0
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /integration/U1/post/counter
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /integration/U1/post/counter
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /integration/U1/post
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /integration/U1/cnt1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 0  Instance: /integration/U1/cnt1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /integration/U1/post/counter
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 0 ps  Iteration: 1  Instance: /integration/U1/cnt1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 100 ps  Iteration: 2  Instance: /integration/U1/cnt1
run
force -freeze sim:/integration/Rst 0 0
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 3  Instance: /integration/U0/U1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 3  Instance: /integration/U1/cnt1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 3  Instance: /integration/U1/cnt1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 3  Instance: /integration/U1/cnt1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 200 ps  Iteration: 3  Instance: /integration/U1/cnt1
run
run
force -freeze sim:/integration/Enable_Bus 0010 0
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 550 ps  Iteration: 0  Instance: /integration/U1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 550 ps  Iteration: 0  Instance: /integration/U1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 600 ps  Iteration: 0  Instance: /integration/U1
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 650 ps  Iteration: 0  Instance: /integration/U1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 700 ps  Iteration: 0  Instance: /integration/U1
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 750 ps  Iteration: 0  Instance: /integration/U1
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 800 ps  Iteration: 0  Instance: /integration/U1
force -freeze sim:/integration/Add_Bus 01000001 0
force -freeze sim:/integration/Data_Bus 00000100 0
run
# ** Warning: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es).
#    Time: 850 ps  Iteration: 0  Instance: /integration/U1
run
force -freeze sim:/integration/Add_Bus 01000010 0
force -freeze sim:/integration/Data_Bus 11010001 0
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
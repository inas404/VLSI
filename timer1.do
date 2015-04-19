vsim work.timer1
# vsim work.timer1 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading ieee.numeric_bit(body)
# Loading work.timer1(data_flow)
# Loading work.prescaler(pre)
# Loading work.counter1(beh)
# Loading work.postscaler(post)
add wave -position end  sim:/timer1/Add_Bus
add wave -position end  sim:/timer1/Data_Bus
add wave -position end  sim:/timer1/En
add wave -position end  sim:/timer1/Clk
add wave -position end  sim:/timer1/R_W
add wave -position end  sim:/timer1/Rst
add wave -position end  sim:/timer1/Ovf
add wave -position end  sim:/timer1/Data12
add wave -position end  sim:/timer1/Control
add wave -position end  sim:/timer1/Counter_Out
add wave -position end  sim:/timer1/Fout_Pre
#add wave -position end  sim:/timer1/Count_Ovf
add wave -position end  sim:/timer1/Pre_Mode
add wave -position end  sim:/timer1/pre/Q
add wave -position end  sim:/timer1/pre/org
add wave -position end  sim:/timer1/pre/Y
add wave -position end  sim:/timer1/Post_Mode
force -freeze sim:/timer1/Add_Bus 00000000 0
force -freeze sim:/timer1/Data_Bus 00000000 0
run

force -freeze sim:/timer1/En 1 0
force -freeze sim:/timer1/Enable_Bus 1 0
force -freeze sim:/timer1/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/timer1/R_W 0 0
force -freeze sim:/timer1/Rst 1 0
run
force -freeze sim:/timer1/Rst 0 0
force -freeze sim:/timer1/Add_Bus 00000000 0
force -freeze sim:/timer1/Data_Bus 00000100 0
run

run
force -freeze sim:/timer1/Add_Bus 00000010 0
force -freeze sim:/timer1/Data_Bus 11001010 0
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
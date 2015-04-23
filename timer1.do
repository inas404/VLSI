vsim work.timer1
add wave -position end  sim:/timer1/Add_Bus
add wave -position end  sim:/timer1/Data_Bus
add wave -position end  sim:/timer1/Enable_Bus
add wave -position end  sim:/timer1/En
add wave -position end  sim:/timer1/Clk
add wave -position end  sim:/timer1/R_W
add wave -position end  sim:/timer1/Rst
add wave -position end  sim:/timer1/Ovf
add wave -position end  sim:/timer1/Data12
add wave -position end  sim:/timer1/Control
add wave -position end  sim:/timer1/Counter_Out
add wave -position end  sim:/timer1/Pre_Mode
add wave -position end  sim:/timer1/Fout_Pre
add wave -position end  sim:/timer1/Cnt_Ovf
add wave -position end  sim:/timer1/Post_Mode
add wave -position end  sim:/timer1/post/OVF

force -freeze sim:/timer1/En 1 0
force -freeze sim:/timer1/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/timer1/Rst 1 0
force -freeze sim:/timer1/R_W 0 0
force -freeze sim:/timer1/Enable_Bus 1 0
force -freeze sim:/timer1/Add_Bus 00000000 0
force -freeze sim:/timer1/Data_Bus 00000110 0
run
force -freeze sim:/timer1/Rst 0 0
force -freeze sim:/timer1/Add_Bus 00000010 0
#force -freeze sim:/timer1/Data_Bus 11010001 0
force -freeze sim:/timer1/Data_Bus 10000010 0
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
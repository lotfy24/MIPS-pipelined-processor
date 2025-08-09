vlib work
vlog ALU_control.v Branch.v  Control_Unit.v Data_Memory.v  Equal_Block.v Extention.v Hazard_Unit.v ID_IE_Reg.v IE_IM_Reg.v IF_ID_Reg.v IM_WB_Reg.v Instruction_memory.v Jumb.v Main_ALU.v MIPS_Processor.v MIPS_tb.v Mux_2_1.v Mux_3_1.v PC_Adder.v PC_Mux.v program_counter.v Register_File.v
vsim -voptargs=+acc work.MIPS_tb
add wave *
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Equal_Block/Equal_D
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Branch_inst/PC_Branch_D
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/program_counter/pcf
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/program_counter/pc
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/IF_ID_reg/Instr_D
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Data_mem_inst/Read_Data_M
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Data_mem_inst/Write_Data_M
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Data_mem_inst/D_mem
run -all
//quit -sim

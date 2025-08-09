vlib work
vlog ALU_control.v Branch.v  Control_Unit.v Data_Memory.v  Equal_Block.v Extention.v Hazard_Unit.v ID_IE_Reg.v IE_IM_Reg.v IF_ID_Reg.v IM_WB_Reg.v Instruction_memory.v  Main_ALU.v MIPS_Processor.v MIPS_tb.v Mux_2_1.v Mux_3_1.v PC_Adder.v PC_Mux.v program_counter.v Register_File.v
vsim -voptargs=+acc work.MIPS_tb
add wave *
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Is_Equal_inst/Equal_D
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Control_Unit_inst/ALU_OP_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/ALU_Src_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/Branch_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/Mem_Read_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/Mem_To_Reg_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/Mem_Write_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/Op_Code \
sim:/MIPS_tb/DUT/Control_Unit_inst/Reg_Dst_D \
sim:/MIPS_tb/DUT/Control_Unit_inst/Reg_Write_D
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/PC_inst/pc \
sim:/MIPS_tb/DUT/PC_inst/pcf
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Data_mem_inst/Read_Data_M
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Data_mem_inst/Write_Data_M
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Data_mem_inst/D_mem
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Stall_D \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Stall_F
add wave -position insertpoint  \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Flush_E \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Forward_AD \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Forward_AE \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Forward_BD \
sim:/MIPS_tb/DUT/Hazard_Unit_inst/Forward_BE
run -all
//quit -sim

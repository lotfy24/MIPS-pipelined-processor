module MIPS_Piplined (clk,rst_n);

input clk,rst_n;

// Internal Wires
// instruction memory
wire [31:0] pcf,RD;
// PC adder
wire [31:0] PC_Plus_4_F;
// IF_ID_Reg
wire [31:0] Instr_D,PC_Plus_4_D;
// Register File inst
wire [4:0] A_3;
wire [31:0] WD_3,RD_1_D,RD_2_D;
wire WE_3;
// Sign Extention
wire [31:0] sign_imm_D;
// Branch
wire [31:0] PC_Branch_D;
// Equal Block 
wire [31:0] op1_D,op2_D;
wire Equal_D;
// Control Unit
wire Reg_Dst_D,ALU_Src_D,Mem_To_Reg_D,Reg_Write_D,Mem_Read_D,Mem_Write_D,Branch_D;
wire [2:0] ALU_OP_D;
// ALU control Unit
wire [3:0] ALU_Instruction_D;
// PC 
wire [31:0] PC;
// ID_IE Reg 
wire [31:0] RD_1_E,RD_2_E,sign_imm_E;
wire [4:0] Rs_D,Rt_D,Rd_D,shamt_D,Rs_E,Rt_E,Rd_E,shamt_E;
wire Reg_Dst_E,Mem_Read_E,Mem_To_Reg_E,Mem_Write_E,ALU_Src_E,Reg_Write_E;
wire [3:0] ALU_Instruction_E;
// ALU
wire [31:0] Src_AE,Src_BE,ALU_Result_E;
// IE_IM_Reg 
wire [31:0] Write_Data_E,ALU_Result_M,Write_Data_M;
wire [4:0] Write_Reg_E,Write_Reg_M;
wire Mem_Read_M,Mem_To_Reg_M,Mem_Write_M,Reg_Write_M;
// Data memory
wire [31:0] Read_Data_M;
// IM_WB_Reg
wire [31:0] Read_Data_W,ALU_Result_W;
wire [4:0] Write_Reg_W;
wire Reg_Write_W,Mem_To_Reg_W;
// Hazard Unit
wire [1:0] Forward_AE,Forward_BE;
wire Stall_F,Stall_D,Flush_E,Forward_AD,Forward_BD;

wire [31:0] Result_W;
wire PCSrc_D;

assign Rs_D = Instr_D[25:21];
assign Rt_D = Instr_D[20:16];
assign Rd_D = Instr_D[15:11];
assign shamt_D = Instr_D[10:6];
// Inastantiations

// instruction memory inst
Instruction_mem Instruction_mem_inst(pcf,RD);
// PC adder inst
PC_Plus_4 PC_Plus_4_inst(pcf,PC_Plus_4_F);
// IF_ID_Reg inst
IF_ID_Reg IF_ID_Reg_inst(RD,PC_Plus_4_F,clk,rst_n,PCSrc_D,(~Stall_D),Instr_D,PC_Plus_4_D);
// Register File inst
assign A_3 = Write_Reg_W;
assign WD_3 = Result_W;
assign WE_3 =Reg_Write_W;
Reg_File Reg_File_inst(Instr_D[25:21],Instr_D[20:16],A_3,clk,WD_3,WE_3,RD_1_D,RD_2_D);
// Sign Extend inst
Extntion Extention_inst(Instr_D[15:0],sign_imm_D);
// Branch inst
Branch Branch_inst(sign_imm_D,PC_Plus_4_D,PC_Branch_D);
// AD mux inst
wire [31:0] in1_D;
assign in1_D = ALU_Result_M;
mux_2_1 AD_mux(RD_1_D,in1_D,Forward_AD,op1_D);  
// BD mux inst
mux_2_1 BD_mux(RD_2_D,in1_D,Forward_BD,op2_D);  
// Equal Block inst
Is_Equal Is_Equal_inst(op1_D,op2_D,Equal_D);
// control Unit inst
Control_Unit Control_Unit_inst(Instr_D[31:26],Reg_Dst_D,Branch_D,Mem_Read_D,Mem_To_Reg_D,ALU_OP_D,Mem_Write_D,
                               ALU_Src_D,Reg_Write_D);

// ALU Control Unit
ALU_Control ALU_Control_inst(ALU_OP_D,Instr_D[5:0],ALU_Instruction_D);


assign PCSrc_D = Branch_D && Equal_D;
wire [31:0] PC_Branch_F;
assign PC_Branch_F = PC_Branch_D;
mux_2_1 PC_mux(PC_Plus_4_F,PC_Branch_F,PCSrc_D,PC);

// PC inst
PC PC_inst(PC,clk,rst_n,(~Stall_F),pcf);
// ID_IE Reg isnt


ID_IE_Reg ID_IE_Reg_inst(clk,rst_n,Flush_E,RD_1_D,RD_2_D,Rs_D,Rt_D,Rd_D,sign_imm_D,Reg_Dst_D,
                         Mem_Read_D,Mem_To_Reg_D,Mem_Write_D,shamt_D,ALU_Src_D,Reg_Write_D,
                         RD_1_E,RD_2_E,ALU_Instruction_D,Rs_E,Rt_E,Rd_E,shamt_E,sign_imm_E,
                         Reg_Dst_E,Mem_Read_E,Mem_To_Reg_E,Mem_Write_E,ALU_Src_E,Reg_Write_E,ALU_Instruction_E);

mux_2_1 #(5) Dest_mux(Rt_E,Rd_E,Reg_Dst_E,Write_Reg_E); 

wire [31:0] in1_E,in2_E;
assign in1_E = Result_W;
assign in2_E = ALU_Result_M;
mux_3_1 Forward_AE_mux(RD_1_E,in1_E,in2_E,Forward_AE,Src_AE);  
mux_3_1 Forward_BE_mux(RD_2_E,in1_E,in2_E,Forward_BE,Write_Data_E);
mux_2_1 ALU_src_mux(Write_Data_E,sign_imm_E,ALU_Src_E,Src_BE);

// ALU inst
ALU ALU_inst(Src_AE,Src_BE,ALU_Instruction_E,shamt_E,ALU_Result_E);
// IE_IM_Reg inst
IE_IM_Reg IE_IM_Reg_inst(clk,rst_n,Mem_Read_E,Mem_To_Reg_E,Mem_Write_E,Reg_Write_E,
                         ALU_Result_E,Write_Data_E,Write_Reg_E,Mem_Read_M,
                         Mem_To_Reg_M,Mem_Write_M,Reg_Write_M,ALU_Result_M,
                         Write_Data_M,Write_Reg_M);
// Data Memory inst
Data_Mem Data_mem_inst(clk,Mem_Read_M,Mem_Write_M,ALU_Result_M,Write_Data_M,Read_Data_M);
// IM_WB_Reg isnt
IM_WB_Reg IM_WB_Reg_inst(clk,rst_n,Reg_Write_M,Mem_To_Reg_M,Read_Data_M,ALU_Result_M,Write_Reg_M,
                         Reg_Write_W,Mem_To_Reg_W,Read_Data_W,ALU_Result_W,Write_Reg_W);

mux_2_1 mem_to_reg_mux(ALU_Result_W,Read_Data_W,Mem_To_Reg_W,Result_W);

// Hazard Unit inst
Hazard_Unit Hazard_Unit_inst(Branch_D,Rs_D,Rt_D,Rs_E,Rt_E,Write_Reg_E,Mem_To_Reg_E,Reg_Write_E,
                             Mem_To_Reg_M,Reg_Write_M,Write_Reg_M,Reg_Write_W,Write_Reg_W,
                             Stall_F,Stall_D,Forward_AD,Forward_BD,Flush_E,Forward_AE,Forward_BE);
endmodule

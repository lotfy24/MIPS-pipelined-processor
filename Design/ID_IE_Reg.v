module ID_IE_Reg (clk,rst_n,clr,op1_D,op2_D,Rs_D,Rt_D,Rd_D,sign_imm_D,
                Reg_Dst_D,Mem_Read_D,Mem_To_Reg_D,Mem_Write_D,shamt_D,
                ALU_Src_D,Reg_Write_D,data_size_D,op1_E,op2_E,ALU_Instruction_D,
                Rs_E,Rt_E,Rd_E,shamt_E,sign_imm_E,Reg_Dst_E,Mem_Read_E,Mem_To_Reg_E,
                Mem_Write_E,ALU_Src_E,Reg_Write_E,ALU_Instruction_E,data_size_E);

input [31:0] sign_imm_D ,op1_D,op2_D;
input [4:0] Rs_D,Rt_D,Rd_D,shamt_D;
input [3:0] ALU_Instruction_D;
input [1:0] data_size_D;
input clk,rst_n,clr,Reg_Dst_D,Mem_Read_D,Mem_To_Reg_D,Mem_Write_D,ALU_Src_D,Reg_Write_D;

output reg [31:0] op1_E,op2_E,sign_imm_E;
output reg [4:0] Rs_E,Rt_E,Rd_E,shamt_E;
output reg [3:0] ALU_Instruction_E;
output reg [1:0] data_size_E;
output reg Reg_Dst_E,Mem_Read_E,Mem_To_Reg_E,Mem_Write_E,ALU_Src_E,Reg_Write_E;

 always @(posedge clk or negedge rst_n) begin
    if((~rst_n) || clr)begin
        op1_E <= 32'b0;
        op2_E <= 32'b0;
        sign_imm_E <= 32'b0;
        Rs_E <=    5'b0;
        Rt_E <=    5'b0;
        Rd_E <=    5'b0;
        shamt_E <= 5'b0;
        data_size_E <= 2'b0;
        Reg_Dst_E    <= 1'b0;
        Mem_Read_E   <= 1'b0;
        Mem_To_Reg_E <= 1'b0;
        Mem_Write_E  <= 1'b0;
        ALU_Src_E    <= 1'b0;
        Reg_Write_E  <= 1'b0;
        ALU_Instruction_E <= 4'b0; 
    end
    else begin
        op1_E <= op1_D;
        op2_E <= op2_D;
        sign_imm_E <= sign_imm_D;
        Rs_E <= Rs_D;
        Rt_E <= Rt_D;
        Rd_E <= Rd_D;
        shamt_E <= shamt_D;
        data_size_E <= data_size_D;
        Reg_Dst_E    <= Reg_Dst_D;
        Mem_Read_E   <= Mem_Read_D;
        Mem_To_Reg_E <= Mem_To_Reg_D;
        Mem_Write_E  <= Mem_Write_D;
        ALU_Src_E    <= ALU_Src_D;
        Reg_Write_E  <= Reg_Write_D;
        ALU_Instruction_E <= ALU_Instruction_D;
        
    end
 end
endmodule
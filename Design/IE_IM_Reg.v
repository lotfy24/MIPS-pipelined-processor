module IE_IM_Reg (clk,rst_n,Mem_Read_E,Mem_To_Reg_E,Mem_Write_E,Reg_Write_E
                 ,ALU_Result_E,Write_Data_E,Write_Reg_E,
                 Mem_Read_M,Mem_To_Reg_M,Mem_Write_M,Reg_Write_M,
                 ALU_Result_M,Write_Data_M,Write_Reg_M);

input [31:0] ALU_Result_E,Write_Data_E;
input [4:0] Write_Reg_E;
input clk,rst_n,Mem_Read_E,Mem_To_Reg_E,Mem_Write_E,Reg_Write_E;

output reg [31:0] ALU_Result_M,Write_Data_M;
output reg [4:0] Write_Reg_M;
output reg Mem_Read_M,Mem_To_Reg_M,Mem_Write_M,Reg_Write_M;

always @(posedge clk or negedge rst_n) begin
    if(~rst_n)begin
        ALU_Result_M <= 32'b0;
        Write_Data_M <= 32'b0;
        Write_Reg_M  <= 5'b0;
        Mem_Read_M   <= 1'b0;     
        Mem_To_Reg_M <= 1'b0;   
        Mem_Write_M  <= 1'b0;   
        Reg_Write_M  <= 1'b0;
    end
    else begin
        ALU_Result_M <= ALU_Result_E;
        Write_Data_M <= Write_Data_E;
        Write_Reg_M  <= Write_Reg_E;
        Mem_Read_M   <= Mem_Read_E;     
        Mem_To_Reg_M <= Mem_To_Reg_E;   
        Mem_Write_M  <= Mem_Write_E;   
        Reg_Write_M  <= Reg_Write_E;
    end
end

endmodule
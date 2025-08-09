module IM_WB_Reg (clk,rst_n,Reg_Write_M,Mem_To_Reg_M,Read_Data_M,ALU_Result_M,Write_Reg_M,
                  Reg_Write_W,Mem_To_Reg_W,Read_Data_W,ALU_Result_W,Write_Reg_W);

input [31:0] ALU_Result_M,Read_Data_M;
input [4:0] Write_Reg_M;
input clk,rst_n,Reg_Write_M,Mem_To_Reg_M;

output reg [31:0] ALU_Result_W,Read_Data_W;
output reg [4:0] Write_Reg_W;
output reg  Reg_Write_W,Mem_To_Reg_W;

always @(posedge clk or negedge rst_n) begin
    if(~rst_n)begin
        ALU_Result_W <= 32'b0;
        Read_Data_W  <= 32'b0;
        Write_Reg_W  <= 5'b0;
        Reg_Write_W  <= 1'b0;
        Mem_To_Reg_W <= 1'b0;
    end
    else begin
        ALU_Result_W <= ALU_Result_M;
        Read_Data_W  <= Read_Data_M;
        Write_Reg_W  <= Write_Reg_M;
        Reg_Write_W  <= Reg_Write_M;
        Mem_To_Reg_W <= Mem_To_Reg_M;
    end
end
endmodule
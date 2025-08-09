module Data_Mem (clk,Mem_Read_M,Mem_Write_M,ALU_Result_M,Write_Data_M,Read_Data_M);
parameter width = 8;
parameter depth = 1024;

input clk,Mem_Read_M,Mem_Write_M;
input [31:0] ALU_Result_M,Write_Data_M;

output reg [31:0] Read_Data_M;

reg [width-1 :0] D_mem [depth-1 :0];
// Big Endian
// read Operation
always @(*) begin
    if(Mem_Read_M)begin

        Read_Data_M [7:0]   = D_mem[ALU_Result_M + 3];
        Read_Data_M [15:8]  = D_mem[ALU_Result_M + 2];
        Read_Data_M [23:16] = D_mem[ALU_Result_M + 1];
        Read_Data_M [31:24] = D_mem[ALU_Result_M]; 

    end
    else begin
        Read_Data_M = 32'b0;    // To prevent latch 
    end
end
// Write Operation
always @(posedge clk) begin
    if(Mem_Write_M)begin 
        
        D_mem[ALU_Result_M]     <= Write_Data_M[31:24];
        D_mem[ALU_Result_M + 1] <= Write_Data_M[23:16];
        D_mem[ALU_Result_M + 2] <= Write_Data_M[15:8];
        D_mem[ALU_Result_M + 3] <= Write_Data_M[7:0];

    end   
end
 
endmodule
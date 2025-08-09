module IF_ID_Reg (RD,PC_Plus_4_F,clk,rst_n,clr,Enable,Instr_D,PC_Plus_4_D);
input [31:0] RD,PC_Plus_4_F;
input clk,rst_n,clr,Enable;
output reg [31:0] Instr_D,PC_Plus_4_D;
always @(posedge clk or negedge rst_n) begin
    if((~rst_n))begin
        Instr_D <= 32'b0;
        PC_Plus_4_D <= 32'b0;
    end
    else if(Enable) begin
        Instr_D <= RD;
        PC_Plus_4_D <= PC_Plus_4_F;
    end
end
endmodule
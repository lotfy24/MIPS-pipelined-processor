module Hazard_Unit (Branch_D,Rs_D,Rt_D,Rs_E,Rt_E,Write_Reg_E,
                    Mem_To_Reg_E,Reg_Write_E,Mem_To_Reg_M,Reg_Write_M,Write_Reg_M,Reg_Write_W,Write_Reg_W,
                    Stall_F,Stall_D,Forward_AD,Forward_BD,Flush_E,Forward_AE,Forward_BE);

input [4:0] Rs_D,Rt_D,Rs_E,Rt_E,Write_Reg_E,Write_Reg_M,Write_Reg_W;
input Branch_D,Mem_To_Reg_E,Reg_Write_E,Mem_To_Reg_M,Reg_Write_M,Reg_Write_W;

output reg  [1:0] Forward_AE,Forward_BE;
output reg  Stall_F,Stall_D,Flush_E;
output Forward_AD,Forward_BD;

wire LW_Stall,Branch_Stall;

assign Forward_AD = (((Rs_D !=0) && (Rs_D == Write_Reg_M)) && Reg_Write_W)?1'b1:1'b0;
assign Forward_BD = (((Rt_D !=0) && (Rt_D == Write_Reg_M)) && Reg_Write_W)?1'b1:1'b0;

always @(*) begin
    if((Rs_E != 0) &&(Rs_E == Write_Reg_M) && Reg_Write_M)begin
        Forward_AE = 2'b10;
    end
    else if((Rs_E != 0) && (Rs_E == Write_Reg_W) && Reg_Write_W)begin
        Forward_AE = 2'b01;
    end
    else begin
        Forward_AE = 2'b00;
    end
end
always @(*) begin
    if((Rt_E != 0) &&(Rt_E == Write_Reg_M) && Reg_Write_M)begin
        Forward_BE = 2'b10;
    end
    else if((Rt_E != 0) &&(Rt_E == Write_Reg_W) && Reg_Write_W)begin
        Forward_BE = 2'b01;
    end
    else begin
        Forward_BE = 2'b00;
    end
end

assign LW_Stall = (Mem_To_Reg_E && ((Rt_E == Rs_D) || (Rt_E == Rt_D)));

assign Branch_Stall = ((Branch_D) &&
                      ((((Write_Reg_E == Rs_D) || (Write_Reg_E == Rt_D)) && Reg_Write_E) ||
                       (((Write_Reg_M == Rs_D) || (Write_Reg_M == Rt_D)) && Reg_Write_M)));


always @(*) begin
    if(LW_Stall || Branch_Stall)begin
        Stall_F = 1'b1;
        Stall_D = 1'b1;
        Flush_E = 1'b1;
    end
    else begin
        Stall_F = 1'b0;
        Stall_D = 1'b0;
        Flush_E = 1'b0;
    end
        
end
endmodule
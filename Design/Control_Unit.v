module Control_Unit(Op_Code,Reg_Dst_D,Branch_D,Mem_Read_D,Mem_To_Reg_D,ALU_OP_D,Mem_Write_D,
                    ALU_Src_D,Reg_Write_D);

input [5:0] Op_Code;
output  Reg_Dst_D,ALU_Src_D,Mem_To_Reg_D,Reg_Write_D,Mem_Read_D,Mem_Write_D,Branch_D;
output [2:0] ALU_OP_D;
reg [9:0] temp;
always @(*) begin
        case (Op_Code)
            6'b000000: temp = 10'b10010000010; // R-Format 
            6'b100011: temp = 10'b01111000000; // LW   
            6'b101011: temp = 10'b01000100000; // SW   
            6'b000100: temp = 10'b00000010001; // BEQ
            6'b001000: temp = 10'b01010000000; // ADDI
            6'b001100: temp = 10'b01010000011; // ANDI
            6'b001101: temp = 10'b01010000100; // ORI
            6'b001010: temp = 10'b01010000101; // SLTI
            6'b001111: temp = 10'b01010000110; // LUI
            6'b001110: temp = 10'b01010000111; // XORI  
            default:   temp = 10'b00000000000; 
        endcase
    end

    assign {Reg_Dst_D, ALU_Src_D, Mem_To_Reg_D, Reg_Write_D,
            Mem_Read_D, Mem_Write_D, Branch_D,
            ALU_OP_D} = temp;
endmodule
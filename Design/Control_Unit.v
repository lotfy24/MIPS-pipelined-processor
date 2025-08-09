module Control_Unit(Op_Code,Reg_Dst_D,Branch_D,Mem_Read_D,Mem_To_Reg_D,ALU_OP_D,Mem_Write_D,
                    ALU_Src_D,Reg_Write_D,ext_type_D,Branch_Not_Equal_D,data_size_D);

input [5:0] Op_Code;
output  Reg_Dst_D,ALU_Src_D,Mem_To_Reg_D,Reg_Write_D,Mem_Read_D,Mem_Write_D,Branch_D,ext_type_D,Branch_Not_Equal_D;
output [2:0] ALU_OP_D;
output [1:0] data_size_D;
reg [13:0] temp;
always @(*) begin
        case (Op_Code)
             6'b000000: temp = 14'b10010000000000; // R-Format
             6'b100011: temp = 14'b01111000001000; // LW 
             6'b101011: temp = 14'b01000100001000; // SW 
             6'b000100: temp = 14'b00000011101000; // BEQ
             6'b000101: temp = 14'b00000001101100; // BNE
             6'b001000: temp = 14'b01010000001000; // ADDI 
             6'b001100: temp = 14'b01010001000000; // ANDI
             6'b001101: temp = 14'b01010001010000; // ORI
             6'b001010: temp = 14'b01010000111000; // SLTI
             6'b001111: temp = 14'b01010001110000; // LUI
             6'b001110: temp = 14'b01010001100000; // XORI
             6'b100000: temp = 14'b01111000001001; // LB
             6'b100001: temp = 14'b01111000001010; // LH
             6'b101000: temp = 14'b01000100001001; // SB
             6'b101001: temp = 14'b01000100001010; // SH
             default:   temp = 14'b00000000000000;
        endcase
    end

    assign {Reg_Dst_D, ALU_Src_D, Mem_To_Reg_D, Reg_Write_D,
            Mem_Read_D, Mem_Write_D, Branch_D,
            ALU_OP_D,ext_type_D,Branch_Not_Equal_D,data_size_D} = temp;
endmodule
module ALU (Src_AE,Src_BE,ALU_Instruction_E,shamt,ALU_Result_E);
input [31:0] Src_AE,Src_BE;
input [4:0] shamt;
input [3:0] ALU_Instruction_E;

output reg [31:0] ALU_Result_E;

always @(*) begin
     case(ALU_Instruction_E)
        4'b0010: ALU_Result_E = Src_AE + Src_BE;                                    //ADD (2)
        4'b0110: ALU_Result_E = Src_AE - Src_BE;                                    //SUB (6)
        4'b0000: ALU_Result_E = Src_AE & Src_BE;                                    //AND (0)
        4'b0001: ALU_Result_E = Src_AE | Src_BE;                                    //OR  (1)
        4'b1100: ALU_Result_E = ~(Src_AE | Src_BE);                                 //NOR (12)
        4'b0100: ALU_Result_E = Src_BE << shamt;                                    //SLL (4)
        4'b0111: ALU_Result_E = ($signed(Src_AE) < $signed(Src_BE))?32'b1:32'b0;    //SLT (7)
        4'b0101: ALU_Result_E = $signed(Src_BE) >>> shamt;                          //SRA (5)
        4'b1000: ALU_Result_E = Src_BE >> shamt;                                    //SRL (8)
        4'b1001: ALU_Result_E = {Src_BE[15:0], 16'b0};                              //LUI (9)
        4'b1101: ALU_Result_E = Src_AE ^ Src_BE;                                    //XOR (13)
        default: ALU_Result_E = 32'b0;
    endcase
end
endmodule
module pc_2_1_mux (PC_Branch_D,PC_Plus_4_F,PCSrc_D,Jump_D,PC,jumb_out);
input [31:0] PC_Branch_D,jumb_out,PC_Plus_4_F;
input PCSrc_D,Jump_D;
output [31:0] PC;

assign PC = ({PCSrc_D,Jump_D} == 2'b10)?PC_Branch_D:({PCSrc_D,Jump_D} == 2'b01)?jumb_out:PC_Plus_4_F;

endmodule
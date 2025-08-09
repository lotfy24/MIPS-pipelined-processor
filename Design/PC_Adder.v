module PC_Plus_4 (pcf,PC_Plus_4_F);
input [31:0] pcf;
output [31:0] PC_Plus_4_F;

assign PC_Plus_4_F = pcf + 4;

endmodule
module Extntion (InstrD_15_0,sign_imm_D);
input [15:0] InstrD_15_0;
output [31:0] sign_imm_D;
assign sign_imm_D = {{16{InstrD_15_0[15]}}, InstrD_15_0};
endmodule
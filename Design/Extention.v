module Extntion (InstrD_15_0,sign_imm_D,ext_type);
input [15:0] InstrD_15_0;
input ext_type;
output [31:0] sign_imm_D;
assign sign_imm_D =(ext_type)?{{16{InstrD_15_0[15]}},InstrD_15_0}:{16'b0,InstrD_15_0};
endmodule
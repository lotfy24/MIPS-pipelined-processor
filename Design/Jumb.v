module Jumb (Instr_D_25_0,PC_Plus_4_4_0_D,jumb_out);
input [25:0] Instr_D_25_0;
input [3:0] PC_Plus_4_4_0_D;
output [31:0] jumb_out;
wire [27:0] shift_out;

assign shift_out = Instr_D_25_0 << 2;
assign jumb_out = {PC_Plus_4_4_0_D,shift_out};
endmodule

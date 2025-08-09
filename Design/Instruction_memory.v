module Instruction_mem (pcf,RD);
parameter width = 8;
parameter depth = 1024;
input [31:0] pcf;
output [31:0] RD;

reg [width-1:0] I_mem [depth-1:0];
// BIG ENDIAN 
assign RD[7:0]   = I_mem[pcf+3];  // LSB
assign RD[15:8]  = I_mem[pcf+2];
assign RD[23:16] = I_mem[pcf+1];
assign RD[31:24] = I_mem[pcf];  // MSB
    
endmodule
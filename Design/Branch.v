module Branch (sign_immD,PC_Plus_4_D,PC_Branch_D);
input [31:0] sign_immD,PC_Plus_4_D;
output [31:0] PC_Branch_D;
// Internal Wires
wire [31:0] shift_out;

assign shift_out  = sign_immD << 2;
assign PC_Branch_D =  shift_out + PC_Plus_4_D;
    
endmodule
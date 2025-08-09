module Is_Equal (op1_D,op2_D,Equal_D);
input [31:0] op1_D,op2_D;
output Equal_D;

assign Equal_D =(op1_D == op2_D)?1'b1:1'b0;

endmodule
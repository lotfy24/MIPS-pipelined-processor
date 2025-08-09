module Reg_File (A_1,A_2,A_3,clk,WD_3,Reg_Write_W,RD_1,RD_2);
parameter width = 32;
parameter depth = 32;
input [31:0] WD_3;
input [4:0] A_1,A_2,A_3;
input clk,Reg_Write_W;
output  [31:0] RD_1,RD_2;

reg [width-1:0] reg_file [depth-1:0];
// read
assign RD_1 = reg_file[A_1];
assign RD_2 = reg_file[A_2];
// write
always @(negedge clk) begin
    if(Reg_Write_W && (A_3 != 0))begin
        reg_file[A_3] <= WD_3;
    end
end   
endmodule
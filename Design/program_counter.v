module PC (pc,clk,rst_n,Enable,pcf);
input [31:0] pc;
input clk,rst_n,Enable;
output reg [31:0] pcf;
always @(posedge clk , negedge rst_n) begin
    if(~rst_n)begin
        pcf <= 32'b0;
    end
    else if(Enable) begin
        pcf <= pc;
    end    
end
endmodule
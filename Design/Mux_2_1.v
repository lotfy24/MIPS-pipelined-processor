module mux_2_1 (in0,in1,sel,out);
parameter n =32;
input [n-1:0] in0,in1;
input sel;
output [n-1:0] out;

assign out = (sel)?in1:in0;
    
endmodule
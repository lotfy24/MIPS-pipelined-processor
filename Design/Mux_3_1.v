module mux_3_1 (in0,in1,in2,sel,out);
parameter n = 32;

input [n-1:0] in0,in1,in2;
input [1:0] sel;

output [n-1:0] out;

assign out = (sel==2'b10)?in2:(sel==2'b01)?in1:in0;
    
endmodule
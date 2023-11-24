`timescale 1ns / 1ps

//R type instructions
module tb_R_type;
    logic[31:0] instr;
    logic signed [31:0] in1;
    logic signed [31:0] in2;
    logic [31:0] out;
R_type r_type (.*);
    initial begin 
     instr =32'b01;
     in1 =32'b01;
     in2 = 32'b01;
#10;
     instr =32'b10;
     in1 =32'b10;
     in2 = 32'b10;
end
always_comb
$monitor(" instr =%d ,in1 =%d, in2 =%d, out=%d",instr,in1,in2,out);

endmodule

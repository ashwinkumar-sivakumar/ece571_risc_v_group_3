`timescale 1ns / 1ps
//`include "intf.sv"
 
//R type r_if.instructions
module tb_R_type;


intf r_if();
    
R_type dut (.*);
    initial begin 
     r_if.instr =32'b01;
     r_if.in1 =32'b01;
     r_if.in2 = 32'b01;
#10;
     r_if.instr =32'b10;
     r_if.in1 =32'b10;
     r_if.in2 = 32'b10;
end
always_comb
$monitor(" r_if.instr =%d ,r_if.in1 =%d, r_if.in2 =%d, r_if.out=%d",r_if.instr,r_if.in1,r_if.in2,r_if.out);

endmodule
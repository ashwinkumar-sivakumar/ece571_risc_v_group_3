`timescale 1ns / 1ps
interface intf;

logic [31:0] instr;
logic signed [31:0] in1;
logic signed [31:0] in2;
logic [31:0] out;
 
modport r_type (
    input  instr,
    input  in1,
    input  in2,
    output out
);

endinterface
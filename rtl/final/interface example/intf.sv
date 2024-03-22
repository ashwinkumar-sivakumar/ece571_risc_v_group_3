`timescale 1ns / 1ps
interface intf;
//R_type parameters
logic [31:0] instr;
logic signed [31:0] in1;
logic signed [31:0] in2;
logic [31:0] out;
//Imem parameters
logic [31:0] iaddr;
logic [31:0] idata;

modport r_type (
    input  instr,
    input  in1,
    input  in2,
    output out
);

modport i_mem(
    input iaddr,
    output idata
);

endinterface
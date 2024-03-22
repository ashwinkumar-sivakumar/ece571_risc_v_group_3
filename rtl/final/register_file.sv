////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module Reg_file////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

import parameters::*;

module regfile (
input clk,
input [4:0] rs1,
input [4:0] rs2,
input [4:0] rd,
input [31:0] regdata,
input wer,
output [MSB:LSB] rv1,
output [MSB:LSB] rv2,
output [MSB:LSB] x31
);
reg [31:0] r[0:31];
integer i;

assign rv1 = r[rs1];
assign rv2 = r[rs2];
assign x31 = r[31];

always_ff @(posedge clk)
begin
r[31]=32'h0;
for (i=0; i< 31; i=i+1)
r[i]=i;
if(wer && rd!=0)
r[rd] <= regdata;
end


endmodule

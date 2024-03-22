////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module I_type////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

import parameters::*;

module I_type(
input [MSB:LSB] idata,
input signed [MSB:LSB] rv1,
input signed [MSB:LSB] imm,
output logic [MSB:LSB] regdata_I
);
wire [31:0] tmp1;
wire [11:0] tmp2;

assign tmp1 = rv1;
assign tmp2 = imm;

always_comb begin
if (idata[6:0] == 7'b0010011) begin
case(idata[14:12])
//unique case({instr[30],instr[14:12]})
3'b000: regdata_I = rv1 + imm; // addi
3'b010: regdata_I = rv1 < imm; // slti
3'b011: regdata_I = tmp1 < tmp2; // sltiu
3'b100: regdata_I = rv1 ^ imm; // xori
3'b110: regdata_I = rv1 | imm; // ori
3'b111: regdata_I = rv1 & imm; // andi
3'b001: regdata_I = rv1 << imm[4:0]; // slli
3'b101: begin
if(idata[30]) // srai It should be srai not srli
regdata_I = rv1 >> imm[4:0];
else // srli
regdata_I = rv1 >>> imm[4:0];
end
default:$display ("\n Not a valid function in I_type module\n");
endcase
end

else
regdata_I='0;
end 


endmodule

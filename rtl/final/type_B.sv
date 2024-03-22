////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module B_type////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

import parameters::*;
module B_type(
    input [MSB:LSB] idata,
    input [MSB:LSB] iaddr,
    input signed [MSB:LSB] imm,
    input signed [MSB:LSB] rv1, rv2,
    output logic [MSB:LSB] iaddr_val
);

wire [31:0] tmp1,tmp2;

assign tmp1 = rv1;
assign tmp2 = rv2;

    always_comb begin
	if (idata[6:0] == 7'b1100011) begin
        unique case (idata[14:12])
            BEQ: iaddr_val = (rv1 == rv2) ? (iaddr + imm) : (iaddr + pcinc);
            BNE: iaddr_val = (rv1 != rv2) ? (iaddr + imm) : (iaddr + pcinc);
            BLT: iaddr_val = (rv1 < rv2) ? (iaddr + imm) : (iaddr + pcinc);
            BGE: iaddr_val = (rv1 >= rv2) ? (iaddr + imm) : (iaddr + pcinc);
            BLTU: iaddr_val = (rv1 < rv2) ? (iaddr + imm) : (iaddr + pcinc);
            BGEU: iaddr_val = (rv1 >= rv2) ? (iaddr + imm) : (iaddr + pcinc);
	default: $display ("\n Not a valid function in B_type module\n");
        endcase
    end
else
iaddr_val='0;
end 

endmodule: B_type

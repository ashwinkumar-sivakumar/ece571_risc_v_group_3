////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module R_type////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

import parameters::*;
module R_type(
    input [MSB:LSB] idata,
    input signed [MSB:LSB] rv1,
    input signed [MSB:LSB] rv2,
    output logic [MSB:LSB] regdata_R
);

    wire [31:0] tmp1;
    wire [31:0] tmp2;

	assign tmp1 = rv1;
	assign tmp2 = rv2;

 always_comb
    begin
	if (idata[6:0] == 7'b0110011) begin
    	unique case({idata[30],idata[14:12]})
        ADD :    regdata_R = rv1+rv2;          //add
        SUB :    regdata_R = rv1-rv2;          //sub
        SLL :    regdata_R = rv1<<rv2[4:0];	  //sll
        SLT :    regdata_R = rv1<rv2;          //slt
        SLTU:    regdata_R = tmp1<tmp2;        //sltu
        XOR :    regdata_R = rv1^rv2;          //xor
        SRL :    regdata_R = rv1>>rv2[4:0];    //srl
        SRA :    regdata_R = rv1>>>rv2[4:0];   //sra
        OR  :    regdata_R = rv1|rv2;          //or
        AND :    regdata_R = rv1&rv2;          //and
        default:$display ("\n Not a valid function in R_type module\n");
        endcase
    end 
else
regdata_R='0;
end  
endmodule

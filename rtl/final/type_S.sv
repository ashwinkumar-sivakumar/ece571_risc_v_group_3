////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module S_type////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

import parameters::*;
module S_type(
    input [MSB:LSB] idata,
    input [MSB:LSB] daddr,
    output logic [3:0] we_S
);
    always_comb begin
	if (idata[6:0] == 7'b0100011) begin
        unique case (idata[14:12])
            SB: we_S = (4'b0001)<< daddr[1:0];
            SH: we_S = (4'b0011) << daddr[1:0];
            SW: we_S = 4'b1111;
            default: $display ("\n Not a valid function in S_type module\n");
        endcase
    end
else
we_S ='0;
end 

endmodule


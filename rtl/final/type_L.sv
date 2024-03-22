////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module L_type////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////
import parameters::*;
module L_type(
    input [MSB:LSB] idata,
    input [MSB:LSB] daddr,
    input [MSB:LSB] drdata,
    output logic [MSB:LSB] regdata_L
);
    logic [MSB:LSB] offset;

    always_comb begin
	
        offset = (daddr[1:0] << 3);  //offset = 8*rv1[1:0]-1 ,eg, 8*1=8, so drdata[15:8]
      	    if (idata[6:0] == 7'b0000011) begin
            unique case (idata[14:12])
            LB: regdata_L = {{24{drdata[offset+7]}}, drdata[offset +: 8]};  // LB
            LH: regdata_L = {{16{drdata[offset+15]}}, drdata[offset +: 16]}; // LH
            LW: regdata_L = drdata; // LW
            LBU: regdata_L = {24'b0, drdata[offset +: 8]}; // LBU
            LHU: regdata_L = {16'b0, drdata[offset +: 16]}; // LHU
            default: $display ("\n Not a valid function in L_type module\n");
            endcase
   	    end
else
regdata_L='0;
end 

endmodule


////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module imem////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////
import parameters::*;   
module imem(
    input [MSB:LSB] iaddr,
    output [MSB:LSB] idata
);
    logic [MSB:LSB] i_arr[LSB:MSB];
    initial begin
		$readmemh("imem1_ini.mem",i_arr);
		
	 end
   assign idata = i_arr[iaddr[31:2]];
endmodule
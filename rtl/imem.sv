`timescale 1ns / 1ps

//IMEM module
    
module imem(intf.i_mem im_if);
    logic [31:0] i_arr[0:31];
    initial begin
		$readmemh("imem1_ini.mem",i_arr);
		//$readmemh("imem5_ini.mem",i_arr);
	 end
    assign im_if.idata = i_arr[im_if.iaddr[31:2]];
endmodule

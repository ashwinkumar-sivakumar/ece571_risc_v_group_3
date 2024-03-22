///////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module dmem////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

import parameters::*;
module dmem (
    input clk,
    input [MSB:LSB] daddr,
    input [MSB:LSB] dwdata,
    input [3:0] we,
    output [MSB:LSB] drdata
);
  
   logic[7:0] m [0:127];
   wire [31:0] add0, add1, add2, add3;

    initial $readmemh("dmem_ini.mem", m);

    assign add0 = (daddr & 32'hfffffffc) + 32'h00000000;
    assign add1 = (daddr & 32'hfffffffc) + 32'h00000001;
    assign add2 = (daddr & 32'hfffffffc) + 32'h00000002;
    assign add3 = (daddr & 32'hfffffffc) + 32'h00000003;

   assign drdata = {m[add3], m[add2], m[add1], m[add0]};
   
 always_ff @(posedge clk) begin
        if (we[0]==1)
            m[add0] = dwdata[7:0];
 //  else m[add0]=32'b0;
        if (we[1]==1)
            m[add1] = dwdata[15:8];
   //  else m[add1]=32'b0;
        if (we[2]==1)
            m[add2] = dwdata[23:16];
   //  else m[add2]=32'b0;

        if (we[3]==1)
            m[add3] = dwdata[31:24];
    // else m[add3]=32'b0;

    end

  endmodule

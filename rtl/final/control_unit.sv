////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Module CPU////////////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
import parameters::*;
module CPU (
    input clk,
    input reset,
    output logic [MSB:LSB] iaddr,  //Stores current Program counter value
    output logic [MSB:LSB] pcinc,     //Stores the value that is to be assigned in the next clk cycle to Program counter
    output [MSB:LSB] x31
);
    logic [3:0] we;     // write enable signal for each byte of 32-b word
    logic wer;
    wire [MSB:LSB] regdata_R, regdata_I;
    wire [MSB:LSB] regdata_L, iaddr_val;
    wire [3:0] we_S;
    wire [MSB:LSB] idata;   // data from instruction memory
    logic [MSB:LSB] daddr;  // address to data memory
    wire [MSB:LSB] drdata;  // data read from data memory
    wire [MSB:LSB] rv1, rv2;
    logic [MSB:LSB] regdata;
    logic [MSB:LSB] dwdata;  // data to be written to data memory
    logic [4:0] rd,rs1,rs2;

//Registers_t' rd, rs1,rs2;
 	r_typeInstr rtype;
 	i_typeInstr itype;
 	opcode_t opcodetype;
	l_typeInstr ltype;
	s_typeInstr stype;
	b_typeInstr btype;

 
    logic signed [MSB:LSB] imm;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset)
            iaddr = 0;
        else begin
            iaddr = pcinc;
	end
    end

    // Instantiating Imem, dmem, and reg file
    imem im2 (.*);
    dmem d1(.*);
    regfile reg1(.*);


    // Instantiating modules from the other block
    R_type r1(idata, rv1, rv2, regdata_R);
    I_type i1(idata, rv1, imm, regdata_I);
    L_type l1(idata, daddr, drdata, regdata_L);
    S_type s1(idata, daddr, we_S);
    B_type b1(idata, iaddr, imm, rv1, rv2, iaddr_val);


    always_comb
    begin
       unique case (idata[6:0])
            R_type:        // R type instructions;
            begin
                rd = idata[11:7];
                rs1 = idata[19:15];
                rs2 = idata[24:20];
                wer = 4'b0001;
                we = 4'b0000;
                regdata = regdata_R;
                pcinc = iaddr + 4;
		$display("R_type");
            end
	
            I_type:     // I type instructions
            begin
                rd = idata[11:7];
                rs1 = idata[19:15];
                imm = {{20{idata[31]}}, idata[31:20]};
                wer = 4'b0001;
                we = 4'b0000;
                regdata = regdata_I;
                pcinc = iaddr + 4;
	  	$display("I_type");	
            end

            L_type:     // L type instructions
            begin
                rd = idata[11:7];
                rs1 = idata[19:15];
                imm = {{20{idata[31]}}, idata[31:20]};
                wer = 4'b0001;
                we = 4'b0000;
                daddr = rv1 + imm;
                regdata = regdata_L;
                pcinc = iaddr + 4;
	  	$display("L_type");
            end

            S_type:      // S type instructions
            begin
                rs1 = idata[19:15];
                rs2 = idata[24:20];
                imm = {{20{idata[31]}}, idata[31:25], idata[11:7]};
                wer = 4'b0000;
                daddr = rv1 + imm;
                case (idata[14:12])
                    3'b000: dwdata = {rv2[7:0], rv2[7:0], rv2[7:0], rv2[7:0]};
                    3'b001: dwdata = {rv2[15:0], rv2[15:0]};
                    3'b010: dwdata = rv2;
		    default: dwdata= 32'b0;
                endcase
                we = we_S;
                pcinc = iaddr + 4;
	  	$display("S_type");
            end

            B_type:      // B type instructions
            begin
                rs1 = idata[19:15];
                rs2 = idata[24:20];
                imm = {{20{idata[31]}}, idata[31], idata[7], idata[30:25], idata[11:8], 1'b0};
                wer = 4'b0000;
                we = 4'b0000;
                pcinc = iaddr_val;
		$display("B_type");
            end
  	
            JALR:     // JALR instruction
            begin
                rs1 = idata[19:15];
                rd = idata[11:7];
                imm = {{20{idata[31]}}, idata[31:20]};
                wer = 4'b0001;
                we = 4'b0000;
                regdata = iaddr + 4;
                pcinc = (rv1 + imm) & 32'hfffffffe;
		$display("JALR_type");
            end
  	
            JAL:      // JAL instruction
            begin
                rd = idata[11:7];
                imm = {{11{idata[31]}}, idata[31], idata[19:12], idata[20], idata[30:21], 1'b0};
                pcinc = (iaddr + imm);
                wer = 4'b0001;
                we = 4'b0000;
                regdata = iaddr + 4;
	  	$display("JAL_type");
            end

            APUIPC:      // AUIPC
            begin
                rd = idata[11:7];
                imm = {idata[31:12], 12'b0};
                wer = 4'b0001;
                we = 4'b0000;
                regdata = iaddr + imm;
                pcinc = iaddr + 4;
		$display("AUIPC_type");
            end
  	
            LUI:      // LUI
            begin
                rd = idata[11:7];
                imm = {idata[31:12], 12'b0};
                wer = 4'b0001;
                we = 4'b0000;
                regdata = imm;
                pcinc = iaddr + 4;
   	        $display("LUI_type");
            end
      


default: $display ("\n Not a valid function in CPU module\n");

endcase

rd= Registers_t' (idata[11:7]);
rs1= Registers_t' (idata[11:7]);
rs2= Registers_t' (idata[11:7]);
rtype= r_typeInstr' ({idata[30],idata[14:12]});
itype= i_typeInstr'(idata[14:12]);
opcodetype= opcode_t'(idata[6:0]);
ltype= l_typeInstr'(idata[14:12]);
stype= s_typeInstr'(idata[14:12]);
btype= b_typeInstr'(idata[14:12]);

end

endmodule



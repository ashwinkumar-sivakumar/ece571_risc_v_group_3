//***************************************************//
//ECE571F23_PROJECT- SINGLE CYCLE RISC-V ARCHITECTURE//
//***************************************************//
///////////LOAD INSTRUCTION////////////////////////////
//***************************************************//
///AUTHOR: Anusha Puttaswamy (anushap@pdx.edu)/////////
//***************************************************//

`timescale 2ns / 1ps

// Enumerate load operation types
typedef enum logic [2:0] {
    LB  = 3'b000,
    LH  = 3'b001,
    LW  = 3'b010,
    LBU = 3'b100,
    LHU = 3'b101
} LoadOpType;

// Package for load operation functions
package LoadPackage;
    function logic [31:0] performLoad(LoadOpType op, logic [31:0] drdata, logic [31:0] offset);
        case (op)
            LB:  return {{24{drdata[offset+7]}}, drdata[offset +: 8]];
            LH:  return {{16{drdata[offset+15]}}, drdata[offset +: 16]];
            LW:  return drdata;
            LBU: return {24'b0, drdata[offset +: 8]};
            LHU: return {16'b0, drdata[offset +: 16]};
            default: return 32'b0; // Default case 
        endcase
    endfunction
endpackage

module L_type(
    input logic [31:0] instr,
    input logic [31:0] daddr,
    input logic [31:0] drdata,
    output logic [31:0] out
);

    logic [31:0] offset;
    LoadPackage::LoadOpType loadOpType;

    always_comb begin
        offset = (daddr[1:0] << 3);
        loadOpType = LoadPackage::LoadOpType'(instr[14:12]);
        out = LoadPackage::performLoad(loadOpType, drdata, offset);
    end

endmodule


// Define a package with the required constants
package STypePackage;
    typedef enum logic [3:0] {
        SB = 4'b0001,
        SH = 4'b0011,
        SW = 4'b1111
    } STypeWE;
endpackage

// Import the package in the module
module S_type(
    input [31:0] instr,
    input [31:0] daddr,
    output reg [3:0] we
);
    import STypePackage::*;

    always_comb begin
        case (instr[14:12])
            3'b000: we = SB << daddr[1:0];
            3'b001: we = SH << daddr[1:0];
            3'b010: we = SW;
            default: we = 4'b0; // Default case, can be adjusted based on requirements
        endcase
    end
endmodule


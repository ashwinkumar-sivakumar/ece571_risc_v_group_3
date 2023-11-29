`timescale 1ns / 1ps

// Import the package containing the enum
package STypePackage;
    typedef enum logic [3:0] {
        SB = 4'b0001,
        SH = 4'b0011,
        SW = 4'b1111
    } STypeWE;
endpackage

// Testbench module
module tb_S_type;

    // Import the package
    import STypePackage::*;

    // Inputs
    reg [31:0] instr;
    reg [31:0] daddr;

    // Outputs
    wire [3:0] we;

    // Instantiate the module
    S_type uut (
        .instr(instr),
        .daddr(daddr),
        .we(we)
    );

    // Test procedure
    initial begin
        // Test case 1: SB
        instr = 3'b000 << 12;
        daddr = 32'hA;
        #10; // Wait for 10 time units
        if (we !== SB)
            $fatal("Test case 1 failed");

        // Test case 2: SH
        instr = 3'b001 << 12;
        daddr = 32'hB;
        #10;
        if (we !== SH)
            $fatal("Test case 2 failed");

        // Test case 3: SW
        instr = 3'b010 << 12;
        daddr = 32'hC;
        #10;
        if (we !== SW)
            $fatal("Test case 3 failed");

        // Add more test cases as needed

        // End simulation
        $finish;
    end

endmodule


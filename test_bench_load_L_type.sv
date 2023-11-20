//***************************************************//
//ECE571F23_PROJECT- SINGLE CYCLE RISC-V ARCHITECTURE//
//***************************************************//
///////////TEST BENCH FOR LOAD INSTRUCTION/////////////
//***************************************************//
///AUTHOR: Anusha Puttaswamy (anushap@pdx.edu)/////////
//***************************************************//
module tb_L_type;
    logic [31:0] instr, daddr, drdata;
    logic [31:0] out;

    initial begin
        // Initialize inputs
        instr = 3'b010; // LW operation
        daddr = 32'h00000008; // Address offset = 8
        drdata = 32'hA5A5A5A5;

        // Apply inputs to the module
        #10 instr = 3'b001; // LH operation
        #10 instr = 3'b100; // LBU operation
        #10 instr = 3'b011; // Unsupported operation, default case

        // Monitor outputs
        #10 $display("out = %h", out);
        #10 $finish; // Finish simulation after a delay
    end

    // Instantiate the module
    L_type uut (
        .instr(instr),
        .daddr(daddr),
        .drdata(drdata),
        .out(out)
    );

endmodule


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

         L_type uut (
        .instr(instr),
        .daddr(daddr),
        .drdata(drdata),
        .out(out)
    );

    initial begin
        instr = 3'b010; // LW operation
        daddr = 32'h00000008; // Address offset = 8
        drdata = 32'hA5A5A5A5;

        #10 instr = 3'b001; // LH operation
        #10 instr = 3'b100; // LBU operation
        #10 instr = 3'b011; //default case test

        #10 $display("out = %h", out);
        #10 $finish; 
    end


endmodule


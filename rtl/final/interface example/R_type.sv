`timescale 1ns / 1ps

module R_type(intf.r_type r_if);
    wire [31:0] tmp1;
    wire [31:0] tmp2;
    assign tmp1 = r_if.in1;
    assign tmp2 = r_if.in2;
typedef enum logic[3:0]{ add,sll,slt,sltu,xor_op,srl,or_op,and_op,sub,sra=4'b1101}opcode;
  always_comb
    begin
    	unique case({r_if.instr[30],r_if.instr[14:12]})
        add:    r_if.out = r_if.in1+r_if.in2;          //add
        sub:    r_if.out = r_if.in1-r_if.in2;          //sub
        sll:    r_if.out = r_if.in1<<r_if.in2[4:0];	  //sll
        slt:    r_if.out = r_if.in1<r_if.in2;          //slt
        sltu:    r_if.out = tmp1<tmp2;        //sltu
        xor_op:    r_if.out = r_if.in1^r_if.in2;          //xor
        srl:    r_if.out = r_if.in1>>r_if.in2[4:0];    //srl
        sra:    r_if.out = r_if.in1>>>r_if.in2[4:0];   //sra
        or_op:    r_if.out = r_if.in1|r_if.in2;          //or
        and_op:    r_if.out = r_if.in1&r_if.in2;          //and
        endcase
    end 

    
endmodule:R_type

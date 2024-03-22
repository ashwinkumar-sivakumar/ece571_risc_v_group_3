////////////////////////////////////////////////////////////////////////////////////////////////////
//////////Package definitions///////////////////////////////////////////////////////////////////////
//*************************************************************************************************//
////////////////////////////////////////////////////////////////////////////////////////////////////
package parameters;
parameter MSB=31;
parameter LSB=0;
parameter pcinc=4;
typedef enum logic[4:0]{R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31}Registers_t;
typedef enum logic[3:0]{ADD=4'b0000, SUB=4'b1000, SLL=4'b0001, SLT=4'b0010, SLTU=4'b0011, XOR=4'b0100, SRL=4'b0101, SRA=4'b1101, OR=4'b0110, AND=4'b0111}r_typeInstr;
typedef enum logic[3:0]{ADDI=4'b0000, SLTI=4'b0010, SLTIU=4'b0011, XORI=4'b0100, ORI=4'b0110, ANDI=4'b0111, SLLI=4'b0001, SRAI=4'b1101, SRLI=4'b0101}i_typeInstr;
typedef enum logic[2:0]{LB=3'b000, LH=3'b001, LW=3'b010, LBU=3'b100, LHU=3'b101}l_typeInstr;
typedef enum logic[2:0]{SB=3'b000, SH=3'b001, SW=3'b010}s_typeInstr;
typedef enum logic[2:0]{BEQ=3'b000, BNE=3'b001, BLT=3'b100, BGE=3'b101, BLTU=3'b110, BGEU=3'b111} b_typeInstr;
typedef enum logic[6:0]{R_type=7'b0110011, I_type=7'b0010011, L_type=7'b0000011, S_type=7'b0100011, B_type=7'b1100011, JALR=7'b1100111, JAL=7'b1101111, APUIPC=7'b0010111, LUI=7'b0110111}opcode_t;
endpackage

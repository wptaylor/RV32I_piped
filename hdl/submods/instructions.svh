

// Instruction enums for easier readability in the decoder

// Might introduce some overhead where only some bits
// per code are used but allows powerful error checking

package INSTRUCTION;
    typedef enum bit[2:0] { 
        R_TYPE  = 3'b000,
        I_TYPE  = 3'b001
     } instruction_type;
endpackage

package OPCODES;
    //TODO: Rest of the opcodes
    typedef enum bit[6:0] {
        OP      = 7'b0110011,
        OP_IMM  = 7'b0010011
    } opcode;
endpackage


//R-type instruction coding
package RTYPE;
    typedef enum bit[6:0] { 
        RA      = 7'b0000000,
        RB      = 7'b0100000
    } funct7;

    //Two enums since (ADD,SUB) and (SRL,SRA) have the same funct3 with different funct7.
    typedef enum bit[2:0] { 
        ADD     = 3'b000,
        SLL     = 3'b001,
        SLT     = 3'b010,
        SLTU    = 3'b011,
        XOR     = 3'b100,
        SRL     = 3'b101,
        OR      = 3'b110,
        AND     = 3'b111
    } funct3_A;
    typedef enum bit[2:0] {
        SUB     = 3'b000,
        SRA     = 3'b101
    } funct3_B;
endpackage



//Can probably combine R- and I-type packages due to their similarities.
//I-type instruction coding
package ITYPE;    
    typedef enum bit[6:0] {
        IB      = 7'b0100000
    } imm_11_5;

    typedef enum bit[2:0] {
        ADDI    = 3'b000,
        SLLI    = 3'b001,
        SLTI    = 3'b010,
        SLTIU   = 3'b011,
        XORI    = 3'b100,
        SRLI    = 3'b101,
        ORI     = 3'b110,
        ANDI    = 3'b111
    } funct3_A; 

    typedef enum bit[2:0] {
        SRLA    = 3'b101
    } funct3_B;
endpackage

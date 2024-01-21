

// Instruction enums for easier readability in the decoder

// Might introduce some overhead where only some bits
// per code are used but allows powerful error checking

package OPCODES;
    //TODO: Rest of the opcodes
    typedef enum bit[6:0] {
        OP      = 7'b0110011,
        OP_IMM  = 7'b0010011
    } opcode;
endpackage


package RTYPE;
    //R-type instruction coding
    typedef enum bit[6:0] { 
        RA      = 7'b0000000,
        RB      = 7'b0100000
    } funct7;

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

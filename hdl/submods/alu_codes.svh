

// ALU operation codes


// Unordered list of ALU operations. Might be able to optimize and map directly to instruction codes in the future.
// Should also check if the compiler optimizes anyways.
package ALU_OP;
    //TODO: Shifts and set operations
    typedef enum bit[3:0] {
        ALU_ADD,
        ALU_SUB,
        ALU_XOR,
        ALU_OR,
        ALU_AND,
        ALU_SLL,
        ALU_SRL,
        ALU_SRA,
        ALU_SLT,
        ALU_SLTU
    } alu_op;
endpackage

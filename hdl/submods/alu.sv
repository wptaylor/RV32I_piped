
// Arithmetic Logic Unit (ALU) module
// Desc: Performs arithmetic and logic operations on two 32-bit inputs.
// Supports addition, subtraction
// Supports bitwise XOR, OR, AND

//`include "alu_codes.svh"

module alu(
    input logic [2:0] op,
    input logic [31:0] in1,
    input logic [31:0] in2,
    output logic [31:0] out
);

    //From "alu_codes.svh"
    import ALU_OP::*;

    always_comb begin
        case (op)
            ALU_OP::ALU_ADD:    out = in1 + in2;
            ALU_OP::ALU_SUB:    out = in1 - in2;
            ALU_OP::ALU_XOR:    out = in1 ^ in2;
            ALU_OP::ALU_OR:     out = in1 | in2;
            ALU_OP::ALU_AND:    out = in1 & in2;
            default:            out = 0; //Error signal goes here in future.
        endcase
    end

endmodule
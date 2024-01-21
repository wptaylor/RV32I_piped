
// Arithmetic Logic Unit (ALU) module
// Desc: Performs arithmetic and logic operations on two 32-bit inputs.
// Supports addition, subtraction
// Supports bitwise XOR, OR, AND

//`include "alu_codes.svh"
module alu(
    input logic [3:0] op,
    input logic signed [31:0] in1,
    input logic signed [31:0] in2,
    output logic signed [31:0] out
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
            ALU_OP::ALU_SLL:    out = in1 << in2;
            ALU_OP::ALU_SRL:    out = in1 >> in2;
            ALU_OP::ALU_SRA:    out = in1 >>> in2;
            ALU_OP::ALU_SLT:    out = in1 < in2;
            ALU_OP::ALU_SLTU:   out = in1[31:0] < in2[31:0]; // Hacky unsigned comparison
            default:            out = 0; //Error signal goes here in future.
        endcase
    end

endmodule
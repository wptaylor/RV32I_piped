

// Instruction decoder

//TODO: Implement all RV32I instructions
//TODO: Add error checking with an error output for unsupported instructions



module decoder(
    input logic clock,
    input logic reset,
    input logic [31:0] instr,
    output logic [4:0] rf_reg1,
    output logic [4:0] rf_reg2,
    output logic [4:0] rf_regw,
    output logic alu_op
);

//`include "instructions.svh"
import OPCODES::*;
import RTYPE::*;

typedef enum bit {  
    ALU_ADD = 1'b0,
    ALU_SUB = 1'b1
} ALU_OP;

always_comb begin
    //Default
    rf_reg1                 = 0;
    rf_reg2                 = 0;
    rf_regw                 = 0;
    alu_op                  = 0;

    //Override
    if (reset) begin end //Keep default
    else case (instr[6:0])
        OP: begin
            rf_reg1 = instr[19:15];
            rf_reg2 = instr[24:20];
            rf_regw = instr[11:7];
            case (instr[31:25])
                RTYPE::RA: begin
                    case (instr[14:12])
                        RTYPE::ADD: alu_op = ALU_ADD;
                        RTYPE::SLL: begin end //Keep default
                        RTYPE::SLT: begin end //Keep default
                        RTYPE::SLTU: begin end //Keep default
                        RTYPE::XOR: begin end //Keep default
                        RTYPE::SRL: begin end //Keep default
                        RTYPE::OR: begin end //Keep default
                        RTYPE::AND: begin end //Keep default
                        default: begin end //Error signal goes here in future.
                    endcase
                end
                RTYPE::RB: begin
                    case (instr[14:12])
                        RTYPE::SUB: alu_op = ALU_SUB;
                        RTYPE::SRA: begin end //Keep default
                        default: begin end //Error signal goes here in future.
                    endcase
                end
                default: begin end //Error signal goes here in future.
            endcase
        end
        OP_IMM: begin
            //TODO: Implement
        end
        default: begin end //Error signal goes here in future.
    endcase
end

endmodule
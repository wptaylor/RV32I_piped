

// Instruction decoder

//TODO: Implement all RV32I instructions
//TODO: Add error checking with an error output for unsupported instructions

//`include "instructions.svh"
//`include "alu_codes.svh"


module decoder(
    input logic clock,
    input logic reset,
    input logic [31:0] instr,
    output logic [4:0] rf_reg1,
    output logic [4:0] rf_reg2,
    output logic [4:0] rf_regw,
    output logic [3:0] alu_op
);

//From "instructions.svh"
import OPCODES::*;
import RTYPE::*;

//From "alu_codes.svh"
import ALU_OP::*;


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
                        RTYPE::ADD:     alu_op = ALU_OP::ALU_ADD;
                        RTYPE::XOR:     alu_op = ALU_OP::ALU_XOR;
                        RTYPE::OR:      alu_op = ALU_OP::ALU_OR;
                        RTYPE::AND:     alu_op = ALU_OP::ALU_AND;
                        RTYPE::SLL:     alu_op = ALU_OP::ALU_SLL;
                        RTYPE::SLT:     alu_op = ALU_OP::ALU_SLT;
                        RTYPE::SLTU:    alu_op = ALU_OP::ALU_SLTU;
                        RTYPE::SRL:     alu_op = ALU_OP::ALU_SRL;
                        default:        begin end //Error signal goes here in future.
                    endcase
                end
                RTYPE::RB: begin
                    case (instr[14:12])
                        RTYPE::SUB:     alu_op = ALU_OP::ALU_SUB;
                        RTYPE::SRA:     alu_op = ALU_OP::ALU_SRA;
                        default:        begin end //Error signal goes here in future.
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
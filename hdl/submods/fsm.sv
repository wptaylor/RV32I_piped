

// Control Unit
// Desc: Decodes instructions and controls the datapath.



module fsm(
    input logic clock,
    input logic reset,
    input INSTRUCTION::instruction_type instr_type_in,
    output logic rf_write,
    output logic alubuf1_load,
    output logic alubuf2_load,
    output logic is_imm
);

//From "instructions.svh*;
import INSTRUCTION::*;

logic [2:0] cstate;

//Pipeline for instruction type
INSTRUCTION::instruction_type instr_type_pipe[1:0];
//TODO: Consider removing explicit values for compactness.
typedef enum bit[2:0] {  
    ERROR       = 3'b000,
    RESET       = 3'b001,
    C1_DECODE   = 3'b010,
    C2_ALUOP    = 3'b011
} state;

always_ff @(posedge clock) begin
    if (reset)          cstate <= RESET;
    else begin
        instr_type_pipe[0]     <= instr_type_in;
        instr_type_pipe[1]     <= instr_type_pipe[0];
        case (cstate)
            ERROR:      cstate <= ERROR;
            RESET:      cstate <= C1_DECODE;
            C1_DECODE:  cstate <= C2_ALUOP;
            C2_ALUOP:   cstate <= C1_DECODE;
			default:    cstate <= ERROR;
        endcase
    end
end

always_comb begin
    //Default
    rf_write                = 0;
    alubuf1_load            = 0;
    alubuf2_load            = 0;
    is_imm                  = 0; //Might be redundant

    //Override
    case (cstate)
        RESET: begin end //Keep default
        C1_DECODE: begin
            alubuf1_load    = 1'b1;
            alubuf2_load    = 1'b1;
        end
        C2_ALUOP: begin
            rf_write        = 1'b1;
            case (instr_type_pipe[1])
                INSTRUCTION::R_TYPE: is_imm = 1'b0;
                INSTRUCTION::I_TYPE: is_imm = 1'b1;
                default: begin end  //Maybe add error checking? Using a 'error' instruction type could be
                                    //an interesting way to propogate zeros through the control path.
            endcase
        end
        default: begin end
    endcase
end

endmodule


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

//TODO: Rest of the opcodes
typedef enum bit[6:0] {
    OP      = 7'b0110011,
    OP_IMM  = 7'b0010011
} opcode;

typedef enum bit {  
    ALU_ADD = 1'b0,
    ALU_SUB = 1'b1
} ALU_OP;

always_comb begin
    //Default
    rf_reg1                 = 5'b0;
    rf_reg2                 = 5'b0;
    rf_regw                 = 5'b0;
    alu_op                  = 1'b0;

    //Override
    if (reset) begin end //Keep default
    else case (instr[6:0])
        OP: begin
            rf_reg1         = instr[19:15];
            rf_reg2         = instr[24:20];
            rf_regw         = instr[11:7];
            alu_op          = instr[30] ? ALU_SUB : ALU_ADD;
        end
        OP_IMM: begin
            //TODO: Implement
        end
        default: begin end //Keep default. Error signal goes here in future.
    endcase
end

endmodule
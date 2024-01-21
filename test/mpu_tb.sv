`timescale 1ns / 100ps


//TODO: Better method of including packages project-wide. Probably a new file in hdl that includes all the packages.
//Should also look online for the standard way of doing this.
//This is hacky since it's relative to the testbench file and not the project root.
`include "..\\hdl\\submods\\alu_codes.svh"
`include "..\\hdl\\submods\\instructions.svh"


//register initial values
`define R1_INIT (-32'd835)
`define R2_INIT (32'd2)

//add r3, r1, r2
`define R1_ADDR (5'd1)
`define R2_ADDR (5'd2)
`define RW_ADDR (5'd3)

`define OP      (ALU_OP::ALU_SRA)


module mpu_tb;

logic clock, reset;
logic [31:0] instr;

mpu #(`R1_INIT, `R2_INIT)
mpu(
    .clock(clock),
    .reset(reset),
    .instr(instr)
);

initial begin
    fork
        run_clock();
        reset_mpu();
        set_instruction(`R1_ADDR, `R2_ADDR, `RW_ADDR, `OP);
    join
end

task run_clock();
    clock = 1'b0;
    forever begin
        #5 clock = ~clock;
    end
endtask

task reset_mpu();
    reset = 1'b1;
    #50 reset = 1'b0;
endtask

//TODO: Use the full R-type instruction coding with opcodes, funct3. Later add the rest of RV32I types.
//Currently uses R-type with funct7, rs2, rs1, and rd. The 5th bit of funct7 determined add/sub.
//Should probably move this logic to a separate file/module.
task set_instruction(
    input logic [31:0] r1_addr,
    input logic [31:0] r2_addr,
    input logic [31:0] rw_addr,
    input logic [2:0]  alu_op
);
    instr = 0;
    instr[19:15] = r1_addr;
    instr[24:20] = r2_addr;
    instr[11:7] = rw_addr;
    case (alu_op)
        ALU_OP::ALU_ADD:    instr[14:12] = RTYPE::ADD;
        ALU_OP::ALU_SUB:    instr[14:12] = RTYPE::SUB;
        ALU_OP::ALU_XOR:    instr[14:12] = RTYPE::XOR;
        ALU_OP::ALU_OR:     instr[14:12] = RTYPE::OR;
        ALU_OP::ALU_AND:    instr[14:12] = RTYPE::AND;
        ALU_OP::ALU_SLL:    instr[14:12] = RTYPE::SLL;
        ALU_OP::ALU_SRL:    instr[14:12] = RTYPE::SRL;
        ALU_OP::ALU_SRA:    instr[14:12] = RTYPE::SRA;
        default:            begin end
    endcase
    //Case here might compile inefficiently, but shouldn't matter for testing.
    case (alu_op)
        ALU_OP::ALU_SUB:    instr[31:25] = RTYPE::RB;
        ALU_OP::ALU_SRA:    instr[31:25] = RTYPE::RB;
        default:            instr[31:25] = RTYPE::RA;
    endcase
    instr[6:0] = 7'b0110011; //OP
endtask

endmodule
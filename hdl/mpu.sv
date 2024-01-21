

//RISC-V Microprocessor Unit
//Desc: Top-level module for the system.
//TODO: Add support for immediate instructions.
//TODO: Change naming convention to match RISC-V spec terminology as much as possible.


module mpu #(
    parameter [31:0] R1_INIT = 0, 
    parameter [31:0] R2_INIT = 0 //Used for testing without support for immediate instructions.
)(
    input logic clock,
    input logic reset,
    input logic [31:0] instr
);

// ------- Control -------- //
logic rf_write;
logic alubuf1_load, alubuf2_load;
logic [3:0] alu_op;

logic [4:0] r1_addr, r2_addr, rw_addr;


// ------- Datapath ------- //
logic [31:0] regfile_out1, regfile_out2;
logic [31:0] alubuf1_out, alubuf2_out;
logic [31:0] alu_out;


// - Finite State Machine - //  
fsm fsm(
    .clock(clock),
    .reset(reset),
    .rf_write(rf_write),
    .alubuf1_load(alubuf1_load),
    .alubuf2_load(alubuf2_load)
);


// -------- Decoder ------- //
decoder decoder(
    .clock(clock),
    .reset(reset),
    .instr(instr),
    .rf_reg1(r1_addr),
    .rf_reg2(r2_addr),
    .rf_regw(rw_addr),
    .alu_op(alu_op)
);


// ----- Register File ---- //
regfile_32x32b #(R1_INIT, R2_INIT) //Used for testing without support for immediate instructions
regfile (
    .clock(clock),
    .set(rf_write),
    .rw_addr(rw_addr),
    .r1_addr(r1_addr),
    .r2_addr(r2_addr),
    .rw_in(alu_out),
    .r1_out(regfile_out1),
    .r2_out(regfile_out2)
);


// ------ ALU Buffers ----- //
reg_32b alubuf1(
    .clock(clock),
    .set(alubuf1_load),
    .in(regfile_out1),
    .out(alubuf1_out)
);

reg_32b alubuf2(
    .clock(clock),
    .set(alubuf2_load),
    .in(regfile_out2),
    .out(alubuf2_out)
);


// --------- ALU --------- //
alu alu(    
    .op(alu_op),
    .in1(alubuf1_out),
    .in2(alubuf2_out),
    .out(alu_out)
);

endmodule

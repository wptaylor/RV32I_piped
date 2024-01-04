`timescale 1ns / 100ps

//register initial values

`define R1_INIT (32'd5)
`define R2_INIT (32'd11)

//add r3, r1, r2
`define R1_ADDR (5'd1)
`define R2_ADDR (5'd2)
`define RW_ADDR (5'd3)
`define OP      (1'b1)


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
task set_instruction(
    input logic [31:0] r1_addr,
    input logic [31:0] r2_addr,
    input logic [31:0] rw_addr,
    input logic op //0 = add, 1 = sub
);
    instr = 0;
    instr[19:15] = r1_addr;
    instr[24:20] = r2_addr;
    instr[11:7] = rw_addr;
    instr[6:0] = 7'b0110011; //OP
    instr[30] = op;
endtask

endmodule
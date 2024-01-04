
// Arithmetic Logic Unit (ALU) module
// Desc: Performs arithmetic and logic operations on two 32-bit inputs.
// Supports addition and subtraction.

module alu(
    input logic op,
    input logic [31:0] in1,
    input logic [31:0] in2,
    output logic [31:0] out
);

    always_comb begin
        case (op)
            1'b0: out = in1 + in2;
            1'b1: out = in1 - in2;
        endcase
    end

endmodule
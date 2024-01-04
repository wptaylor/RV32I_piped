

//32x32 register file with synchronous set
//No reset functionality to comply with Altera and Intel MAX 10 memory block synthesis.
//Currently no zero register, but can be added later.

module regfile_32x32b #(
    parameter [31:0] R1_INIT = 0,
    parameter [31:0] R2_INIT = 0//Used for testing without support for immediate instructions.
)(   
    input logic clock,
    input logic set,
    input logic [4:0] rw_addr,
    input logic [4:0] r1_addr,
    input logic [4:0] r2_addr,
    input logic [31:0] rw_in,
    output logic [31:0] r1_out,
    output logic [31:0] r2_out
);

    logic [31:0] rf [31:0];

    initial begin
        rf = '{default: 0};
        rf[1] = R1_INIT;
        rf[2] = R2_INIT;
    end

    always @(posedge clock) begin
        r1_out <= rf[r1_addr];
        r2_out <= rf[r2_addr];
        if (set) begin
            rf[rw_addr] <= rw_in;
        end
    end

endmodule



//32-bit register with synchronous set.
//No reset functionality due to being on the datapath.

module reg_32b(
    input logic clock,
    input logic set,
    input logic [31:0] in,
    output logic [31:0] out
);

    always_ff @(posedge clock) begin
        if (set) begin
            out <= in;
		end
    end

endmodule
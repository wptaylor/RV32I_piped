

//12-bit input, 12 bit  register with synchronous set.
//No reset functionality due to being on the datapath.

//Also sign extends, as the spec seems to imply 12 bit immediates are always sign extended for I-type.

module reg_12b_to_32b(
    input logic clock,
    input logic set,
    input logic [11:0] in,
    output logic [31:0] out
);

    always_ff @(posedge clock) begin
        if (set) begin
            out <= {{20{in[11]}}, in}; //Don't know if there's a more idometic sign ext in SV?
		end
    end

endmodule
module mux2_to_1_32b(
    input logic[31:0] x0,
    input logic[31:0] x1,
    input logic sel,
    output logic[31:0] out
);

always_comb begin
    case(sel)
        1'b0: out = x0;
        1'b1: out = x1;
    endcase
end

endmodule
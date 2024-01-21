

// Control Unit
// Desc: Decodes instructions and controls the datapath.

module fsm(
    input logic clock,
    input logic reset,
    output logic rf_write,
    output logic alubuf1_load,
    output logic alubuf2_load
);


logic [2:0] cstate;
//TODO: Consider removing explicit values for compactness.
typedef enum bit[2:0] {  
    ERROR       = 3'b000,
    RESET       = 3'b001,
    C1_DECODE   = 3'b010,
    C2_ADDSUB   = 3'b011
} state;

always_ff @(posedge clock) begin
    if (reset)          cstate <= RESET;
    else begin
        case (cstate)
            ERROR:      cstate <= ERROR;
            RESET:      cstate <= C1_DECODE;
            C1_DECODE:  cstate <= C2_ADDSUB;
            C2_ADDSUB:  cstate <= C1_DECODE;
			default:    cstate <= ERROR;
        endcase
    end
end

//TODO: Move instruction slicing to the datapath with multiplexers.
always_comb begin
    //Default
    rf_write                = 1'b0;
    alubuf1_load            = 1'b0;
    alubuf2_load            = 1'b0;

    //Override
    case (cstate)
        RESET: begin end //Keep default
        C1_DECODE: begin
            alubuf1_load    = 1'b1;
            alubuf2_load    = 1'b1;
        end
        C2_ADDSUB: begin
            rf_write        = 1'b1;
        end
        default: begin end
    endcase
end

endmodule
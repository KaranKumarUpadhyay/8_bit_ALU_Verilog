module alu_8bit(
    input  [7:0] A,        
    input  [7:0] B,        
    input  [2:0] op,

    output reg [7:0] result, 
    output reg carry         
);

    always @(*) begin
        // Default values
        result = 8'b00000000;
        carry  = 1'b0;

        case (op)

            3'b000: begin   // ADD
                {carry, result} = A + B;
            end

            3'b001: begin   // SUBTRACT
                {carry, result} = A - B;
            end

            3'b010: begin   // AND
                result = A & B;
                carry  = 1'b0;
            end

            3'b011: begin   // OR
                result = A | B;
                carry  = 1'b0;
            end

            3'b100: begin   // XOR
                result = A ^ B;
                carry  = 1'b0;
            end

            default: begin
                result = 8'b00000000;
                carry  = 1'b0;
            end

        endcase
    end

endmodule

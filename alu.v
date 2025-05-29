module alu(
    input wire [2:0] opcode,
    input wire [7:0] acc_data,
    input wire [7:0] mem_out,
    output reg [7:0] result,
    output reg is_zero
);

always @(*) begin
    case (opcode)
        3'b010: result = acc_data + mem_out;  // ADD
        3'b011: result = acc_data & mem_out;  // AND
        3'b100: result = acc_data ^ mem_out;  // XOR
        3'b101: result = mem_out;             // LDA
        default: result = acc_data;           // Default case
    endcase
    
    is_zero = (acc_data == 8'b0);
end

endmodule
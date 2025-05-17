module alu(
    input wire [2:0] opcode,
    input wire [7:0] data_acc,
    input wire [7:0] data_mem,
    output reg [7:0] result,
    output reg is_zero
);

always @(*) begin
    case (opcode)
        3'b000: result = data_acc;  // HLT
        3'b001: result = data_acc;  // SKZ
        3'b010: result = data_acc + data_mem; // ADD
        3'b011: result = data_acc & data_mem; // AND
        3'b100: result = data_acc ^ data_mem; // XOR
        3'b101: result = data_mem;  // LDA
        3'b110: result = data_acc;  // STO
        3'b111: result = data_acc;  // JMP
        default: result = data_acc;
    endcase
    
    is_zero = (data_acc == 0) ? 1 : 0; 
end

endmodule

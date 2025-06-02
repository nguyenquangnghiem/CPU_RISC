module alu(
    input wire [2:0] opcode,
    input wire [7:0] acc_data,
    input wire [7:0] mem_out,
    output wire [7:0] result,
    output wire is_zero
);

assign result = (opcode == 3'b010) ? (acc_data + mem_out) : // ADD
                (opcode == 3'b011) ? (acc_data & mem_out) : // AND
                (opcode == 3'b100) ? (acc_data ^ mem_out) : // XOR
                (opcode == 3'b101) ? mem_out :              // LDA
                acc_data;

assign is_zero = (result == 8'b0);  

endmodule

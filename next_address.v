module next_address(
    input wire [4:0] pc,
    input wire inc_pc,
    input wire is_zero,
    input wire clk,
    input wire rst,
    input wire ld_pc,
    input wire [2:0] opcode,
    input wire [4:0] jump_addr,
    output reg [4:0] next_pc
);  

always @(posedge clk or posedge rst) begin
    if (rst) 
        next_pc <= 5'b0;
    else if (ld_pc) 
        next_pc <= jump_addr;
    else if (inc_pc) begin
        if (opcode == 3'b001 && is_zero == 1) // SKZ
            next_pc <= pc + 2;
        else 
            next_pc <= pc + 1;
    end
end

endmodule

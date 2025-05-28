module pc(
    input wire clk,
    input wire rst, 
    input wire ld_pc,
    input wire is_zero,
    input wire inc_pc,
    input wire [2:0] opcode,
    input wire [4:0] mux_addr,

    output reg [4:0] pc
);

always @(posedge clk or posedge rst) begin
    if (rst) 
        pc <= 5'b0; 
    else if (ld_pc) 
        pc <= mux_addr;
    else if(inc_pc) begin
        if (is_zero && opcode == 3'b001) 
            pc <= pc + 2;
        else
            pc <= pc + 1;
    end 
    else 
        pc <= pc; 
end

endmodule
module ir(
    input wire clk,
    input wire rst,
    input wire ld_ir,
    input wire [7:0] instruction,
    output reg [4:0] data_addr,
    output reg [2:0] opcode
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        data_addr <= 5'b0;
        opcode <= 3'b0; 
    end else if (ld_ir) begin
        data_addr <= instruction[4:0];
        opcode <= instruction[7:5];
    end
end

endmodule

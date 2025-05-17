module pc(
    input wire clk,
    input wire rst,
    input wire ld_pc,
    input wire [4:0] pc_in,
    output reg [4:0] pc_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        pc_out <= 5'b0;
    else 
        pc_out <= pc_in ;
end

endmodule

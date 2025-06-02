module pc(
    input wire clk,
    input wire rst, 
    input wire ld_pc,
    input wire inc_pc,
    input wire [4:0] mux_addr,

    output reg [4:0] pc
);

always @(posedge clk or posedge rst) begin
    if (rst) 
        pc <= 5'b0; 
    else if (ld_pc) 
        pc <= mux_addr;
    else if(inc_pc) 
        pc <= pc + 5'b00001;
    else 
        pc <= pc; 
end

endmodule

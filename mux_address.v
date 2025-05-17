module mux_address(
    input wire sel,
    input wire [4:0] pc_addr,
    input wire [4:0] data_addr,
    output reg [4:0] addr_out
);

always @(*) begin
    addr_out = sel ? pc_addr : data_addr;
end

endmodule

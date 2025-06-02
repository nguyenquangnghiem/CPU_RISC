module address_mux(
    input wire sel,
    input wire [4:0] pc,
    input wire [4:0] address,
    output wire [4:0] mux_addr
);

assign mux_addr = sel ? pc : address;

endmodule
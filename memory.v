module memory(
    input wire clk,
    input wire rst,
    input wire data_e,
    input wire wrt,
    input wire rd, 
    input wire is_zero,
    input wire [4:0] mux_addr,
    inout wire [7:0] data_bus,
    output reg [7:0] mem_out
);

reg [7:0] memory[0:31];

integer i;
initial begin
    for (i = 0; i < 32; i = i + 1) begin
        memory[i] = 8'b0;
    end
    $readmemb("memory_init.bin", memory);
end

assign data_bus = (data_e && wrt) ? mem_out : 8'bz;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        mem_out <= 8'b0;
    end
    else begin
        if (rd) begin
            mem_out <= memory[mux_addr];
        end
        else if (wrt && data_e) begin
            memory[mux_addr] <= data_bus;
            mem_out <= data_bus;
        end
    end
end

endmodule
module memory(
    input wire clk,
    input wire rst,
    input wire data_e,
    input wire wrt,
    input wire rd, 
    input wire [4:0] mux_addr,
    inout wire [7:0] data_bus,
    output wire [7:0] mem_out
);

reg [7:0] memory[0:31];  
reg [7:0] data_out;

assign data_bus = (data_e && wrt) ? data_out : 8'bz;
assign mem_out = data_out;

initial begin
    $readmemb("memory_init.bin", memory);
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        data_out <= 8'b0;
    end
    else if (wrt && data_e) begin
        memory[mux_addr] <= data_bus;
        data_out <= data_bus;
    end
    else if (rd) begin
        data_out <= memory[mux_addr];
    end
    else begin
        data_out <= data_out;
    end
end
endmodule
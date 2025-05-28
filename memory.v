module memory(
    input wire clk,
    input wire rst,
    input wire data_e,
    input wire wrt,
    input wire rd,
    input wire [4:0] mux_addr,
    input wire [7:0] acc_data,
    output reg [7:0] mem_out
);

reg [7:0] memory[0:31];  

initial begin
    $readmemb("memory_init.bin", memory);
end
always @(posedge clk or posedge rst) begin
    if (rst) begin
        mem_out <= 8'b0;
    end
    else if (wrt && data_e) begin
        memory[mux_addr] <= acc_data;
        mem_out <= acc_data;  
    end
    else if (rd) begin
        mem_out <= memory[mux_addr];
    end
    else 
        mem_out <= mem_out;
end

endmodule
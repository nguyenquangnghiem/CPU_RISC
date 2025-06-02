module memory(
    input wire clk,
    input wire rst,
    input wire rd,
    input wire wrt,
    input wire [4:0] mux_addr,
    inout wire [7:0] data_bus

);

reg [7:0] mem_out ;

reg [7:0] memory[0:31];

assign data_bus = (rd && !wrt) ? mem_out : 8'bz ;

initial begin
    $readmemb("memory_init.bin", memory);
end

initial begin
    #1000
    $display("Memory[4] = %h", mem.memory[7]);  // in dạng hexa
end



always @(posedge clk or posedge rst) begin
    if (rst) begin
        mem_out <= 8'b0;
    end

    else if (wrt) begin
        memory[mux_addr] <= data_bus;
    end

    else if (rd && !wrt) begin
        mem_out <= memory[mux_addr];
    end

    else 
        mem_out <= mem_out ;
end

endmodule

module data_mux(
    input wire data_e,
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [7:0] out
);

assign out = data_e ? a : b;

endmodule
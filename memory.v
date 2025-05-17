module ram(
    input wire clk,
    input wire rst,
    input wire wr,
    input wire data_e,
    input wire rd,
    input wire [4:0] addr,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] memory [0:31];

initial begin
    // Khởi tạo dữ liệu mẫu
    memory[0] = 8'h05;  // 5
    memory[1] = 8'h07;  // 7
    memory[2] = 8'h00;  // 0
    memory[3] = 8'h0A;  // 10
    memory[4] = 8'h03;  // 3
end 

always @(posedge clk or posedge rst) begin
    if (rst)
        data_out <= 8'b0;
    else if (wr && data_e)
        memory[addr] <= data_in;
    else if (rd)
        data_out <= memory[addr];
end

endmodule

module rom(
    input wire clk,
    input wire rst,
    input wire rd,
    input wire [4:0] addr,
    output reg [7:0] data_out
);

reg [7:0] memory [0:31];

initial begin
    // Chương trình mẫu
    memory[0] = 8'b101_00000; // LDA [0]
    memory[1] = 8'b010_00001; // ADD [1]
    memory[2] = 8'b100_00010; // XOR [2]
    memory[3] = 8'b001_00001; // SKIP
    memory[4] = 8'b000_00000; // HLT
    memory[5] = 8'b110_00010; // STO
    memory[6] = 8'b101_00010 ; // LOAD 
end

always @(posedge clk or posedge rst) begin
    if (rst)
        data_out <= 8'b0;
    else if (rd)
        data_out <= memory[addr];
end

endmodule

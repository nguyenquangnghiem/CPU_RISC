module acc(
    input wire clk,
    input wire rst,
    input wire ld_ac,
    input wire [7:0] data_in,
    output reg [7:0] acc_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        acc_out <= 8'b0;
    else if (ld_ac)
        acc_out <= data_in;
end

endmodule

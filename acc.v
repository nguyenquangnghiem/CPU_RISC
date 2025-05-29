module acc(
    input wire clk,
    input wire rst,
    input wire ld_ac,
    input wire [7:0] result,
    output reg [7:0] acc_data
);

always @(posedge clk or posedge rst) begin
    if (rst)
        acc_data <= 8'b0;
    else if (ld_ac)
        acc_data <= result;
end

endmodule
`include "cpu.v"
module tb_cpu;
reg clk;
reg rst;

cpu u_cpu(
    .clk(clk),
    .rst(rst)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_cpu.vcd");
    $dumpvars(0, tb_cpu);
end

initial begin
    clk = 1'b1 ;
    rst = 1'b1 ; #10
    rst = 1'b0 ; 
    #500 $finish;
end

endmodule
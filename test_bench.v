`include "cpu.v"
module tb_cpu;

reg clk, rst;

cpu uut(
    .clk(clk),
    .rst(rst)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    #10 rst = 0;
    #600 $finish;
end

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, tb_cpu);
end

endmodule

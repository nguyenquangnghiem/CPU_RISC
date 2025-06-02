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
    #10000 $finish;
end


    // initial begin
    //     $monitor("Time=%0t PC=%h Opcode=%b Operand=%h Acc=%d is_zero=%b sel=%b rd=%b ld_ir=%b halt=%b inc_pc=%b ld_ac=%b ld_pc=%b wr=%b data_e=%b state=%b" , 
    //              $time, u_cpu.pc, u_cpu.opcode, u_cpu.address, u_cpu.acc_data, u_cpu.is_zero, u_cpu.sel, u_cpu.rd, u_cpu.ld_ir, u_cpu.halt_out, u_cpu.inc_pc, u_cpu.ld_ac, u_cpu.ld_pc, u_cpu.wr, u_cpu.data_e,  u_cpu.ctrl.state);
    // end

endmodule

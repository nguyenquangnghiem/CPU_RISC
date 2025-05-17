`include "pc.v"
`include "mux_address.v"
`include "memory.v"
`include "ir.v"
`include "alu.v"
`include "acc.v"
`include "controller.v"
`include "next_address.v"
`timescale 1ns / 1ps

module cpu(
    input wire clk,
    input wire rst
);

// Các wire kết nối
wire [4:0] pc_out, mux_addr, ir_addr, pc_in, next_pc;
wire [7:0] rom_data, ram_data, alu_result, acc_out, jump_addr;
wire [2:0] opcode;
wire is_zero;
wire sel, rd, ld_ir, halt, inc_pc, ld_ac, ld_pc, wr, data_e;

// Instantiate các module
pc u_pc(
    .clk(clk),
    .rst(rst),
    .ld_pc(ld_pc),
    .pc_in(mux_addr),
    .pc_out(pc_out)
);

next_address u_next_pc(
    .clk(clk),
    .pc(pc_out),
    .is_zero(is_zero),
    .opcode(opcode),
    .inc_pc(inc_pc),
    .rst(rst),
    .ld_pc(ld_pc),
    .jump_addr(ir_addr),
    .next_pc(next_pc)
);

mux_address u_mux(
    .sel(sel),
    .pc_addr(next_pc),
    .data_addr(ir_addr),
    .addr_out(mux_addr)
);

rom u_rom(
    .clk(clk),
    .rst(rst),
    .rd(sel & rd),
    .addr(pc_out),
    .data_out(rom_data)
);

ram u_ram(
    .clk(clk),
    .rst(rst),
    .data_e(data_e),
    .wr(wr),
    .rd(~sel & rd),
    .addr(mux_addr),
    .data_in(acc_out),
    .data_out(ram_data)
);

ir u_ir(
    .clk(clk),
    .rst(rst),
    .ld_ir(ld_ir),
    .instruction(rom_data),
    .data_addr(ir_addr),
    .opcode(opcode)
);

alu u_alu(
    .opcode(opcode),
    .data_acc(acc_out),
    .data_mem(ram_data),
    .result(alu_result),
    .is_zero(is_zero)
);

acc u_acc(
    .clk(clk),
    .rst(rst),
    .ld_ac(ld_ac),
    .data_in(alu_result),
    .acc_out(acc_out)
);

controller u_ctrl(
    .clk(clk),
    .rst(rst),
    .is_zero(is_zero),
    .opcode(opcode),
    .sel(sel),
    .rd(rd),
    .ld_ir(ld_ir),
    .halt(halt),
    .inc_pc(inc_pc),
    .ld_ac(ld_ac),
    .ld_pc(ld_pc),
    .wr(wr),
    .data_e(data_e)
);

endmodule

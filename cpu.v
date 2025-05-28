`include "controller.v"
`include "pc.v"
`include "ir.v"
`include "acc.v"
`include "alu.v"
`include "address_mux.v"
`include "memory.v"
// Module: cpu
// Description: Top-level module for a simple CPU design
module cpu(
    input wire clk,
    input wire rst,

    output wire halt_out
);

    wire [2:0] opcode;
    wire [7:0] mem_out;
    wire [4:0] address;
    wire [7:0] result;
    wire [7:0] acc_data;
    wire [4:0] pc;
    wire [4:0] mux_addr;

    wire sel, rd, ld_ir, inc_pc, ld_ac, ld_pc, wr, data_e, is_zero;

    controller ctrl(
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .sel(sel),
        .rd(rd),
        .ld_ir(ld_ir),
        .halt(halt_out),
        .inc_pc(inc_pc),
        .ld_ac(ld_ac),
        .ld_pc(ld_pc),
        .wr(wr),
        .data_e(data_e)
    );

    pc program_counter(
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .ld_pc(ld_pc),
        .is_zero(is_zero),
        .inc_pc(inc_pc),
        .mux_addr(mux_addr),
        .pc(pc)
    );

    ir instruction_register(
        .clk(clk),
        .rst(rst),
        .ld_ir(ld_ir),
        .mem_out(mem_out),
        .opcode(opcode),
        .address(address)
    );

    acc accumulator(
        .clk(clk),
        .rst(rst),
        .ld_ac(ld_ac),
        .result(result),
        .acc_data(acc_data)
    );

    alu u_alu(
        .opcode(opcode),
        .acc_data(acc_data),
        .mem_out(mem_out),
        .result(result),
        .is_zero(is_zero)
    );

    address_mux addr_mux(
        .sel(sel),
        .pc(pc),
        .address(address),
        .mux_addr(mux_addr)
    );

    memory mem(
        .clk(clk),
        .rst(rst),
        .data_e(data_e),
        .wrt(wr),
        .rd(rd),
        .mux_addr(mux_addr),
        .acc_data(acc_data),
        .mem_out(mem_out)
    );

endmodule

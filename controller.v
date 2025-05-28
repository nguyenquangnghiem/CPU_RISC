// module controller(
//     input wire clk,
//     input wire rst,
//     input wire [2:0] opcode,
//     output reg sel,
//     output reg rd,
//     output reg ld_ir,
//     output reg halt,
//     output reg inc_pc,
//     output reg ld_ac,
//     output reg ld_pc,
//     output reg wr,
//     output reg data_e
// );

// parameter INST_ADDR  = 3'd0;
// parameter INST_FETCH = 3'd1;
// parameter INST_LOAD  = 3'd2;
// parameter OP_ADDR    = 3'd3;
// parameter OP_FETCH   = 3'd4;
// parameter ALU_OP     = 3'd5;
// parameter STORE      = 3'd6;

// parameter HLT = 3'b000;
// parameter SKZ = 3'b001;
// parameter ADD = 3'b010;
// parameter AND = 3'b011;
// parameter XOR = 3'b100;
// parameter LDA = 3'b101;
// parameter STO = 3'b110;
// parameter JMP = 3'b111;

// reg [2:0] state;

// always @(posedge clk or posedge rst) begin
//     if (rst) begin
//         state <= INST_ADDR;
//         sel <= 1'b0;
//         rd <= 1'b0;
//         ld_ir <= 1'b0;
//         halt <= 1'b0;
//         inc_pc <= 1'b0;
//         ld_ac <= 1'b0;
//         ld_pc <= 1'b0;
//         wr <= 1'b0;
//         data_e <= 1'b0;
//     end
//     else begin
//         case (state)
//             INST_ADDR: begin
//                 sel     <= 1'b1;
//                 rd      <= 1'b0;
//                 ld_ir   <= 1'b0;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= 1'b0;
//                 state   <= INST_FETCH;
//             end

//             INST_FETCH: begin
//                 sel     <= 1'b1;
//                 rd      <= 1'b1;
//                 ld_ir   <= 1'b0;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= 1'b0;
//                 state   <= INST_LOAD;
//             end

//             INST_LOAD: begin
//                 sel     <= 1'b1;
//                 rd      <= 1'b1;
//                 ld_ir   <= 1'b1;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= 1'b0;
//                 state   <= OP_ADDR;
//             end

//             OP_ADDR: begin
//                 sel     <= 1'b0;
//                 rd      <= 1'b0;
//                 ld_ir   <= 1'b0;
//                 halt    <= (opcode == HLT) ? 1'b1 : 1'b0;
//                 inc_pc  <= (opcode != HLT) ? 1'b1 : 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= 1'b0;
//                 if (opcode == HLT)
//                     state <= OP_ADDR;
//                 else if (opcode == STO)
//                     state <= STORE;
//                 else if (opcode == SKZ || opcode == JMP)
//                     state <= INST_ADDR;
//                 else
//                     state <= OP_FETCH;
//             end

//             OP_FETCH: begin
//                 sel     <= 1'b0;
//                 rd      <= (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA) ? 1'b1 : 1'b0;
//                 ld_ir   <= 1'b0;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= 1'b0;
//                 state   <= ALU_OP;
//             end

//             ALU_OP: begin
//                 sel     <= 1'b0;
//                 rd      <= (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA) ? 1'b1 : 1'b0;
//                 ld_ir   <= 1'b0;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= (opcode == JMP) ? 1'b1 : 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= (opcode == STO) ? 1'b1 : 1'b0;
//                 state   <= STORE;
//             end

//             STORE: begin
//                 sel     <= 1'b0;
//                 rd      <= 1'b0;
//                 ld_ir   <= 1'b0;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA) ? 1'b1 : 1'b0;
//                 ld_pc   <= (opcode == JMP) ? 1'b1 : 1'b0;
//                 wr      <= (opcode == STO) ? 1'b1 : 1'b0;
//                 data_e  <= (opcode == STO) ? 1'b1 : 1'b0;
//                 state   <= INST_ADDR;
//             end

//             default: begin
//                 sel     <= 1'b0;
//                 rd      <= 1'b0;
//                 ld_ir   <= 1'b0;
//                 halt    <= 1'b0;
//                 inc_pc  <= 1'b0;
//                 ld_ac   <= 1'b0;
//                 ld_pc   <= 1'b0;
//                 wr      <= 1'b0;
//                 data_e  <= 1'b0;
//                 state   <= INST_ADDR;
//             end
//         endcase
//     end
// end

// endmodule


module controller(
    input wire clk,
    input wire rst,
    input wire [2:0] opcode,
    output reg sel,
    output reg rd,
    output reg ld_ir,
    output reg halt,
    output reg inc_pc,
    output reg ld_ac,
    output reg ld_pc,
    output reg wr,
    output reg data_e
);

parameter INST_ADDR  = 3'd0;
parameter INST_FETCH = 3'd1;
parameter INST_LOAD  = 3'd2;
parameter OP_ADDR    = 3'd3;
parameter OP_FETCH   = 3'd4;
parameter ALU_OP     = 3'd5;
parameter STORE      = 3'd6;
parameter IDLE       = 3'd7;  // Thêm trạng thái IDLE

parameter HLT = 3'b000;
parameter SKZ = 3'b001;
parameter ADD = 3'b010;
parameter AND = 3'b011;
parameter XOR = 3'b100;
parameter LDA = 3'b101;
parameter STO = 3'b110;
parameter JMP = 3'b111;

reg [2:0] state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= INST_ADDR;
        sel <= 1'b0;
        rd <= 1'b0;
        ld_ir <= 1'b0;
        halt <= 1'b0;
        inc_pc <= 1'b0;
        ld_ac <= 1'b0;
        ld_pc <= 1'b0;
        wr <= 1'b0;
        data_e <= 1'b0;
    end
    else begin
        case (state)
            INST_ADDR: begin
                sel     <= 1'b1;
                rd      <= 1'b0;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                state   <= INST_FETCH;
            end

            INST_FETCH: begin
                sel     <= 1'b1;
                rd      <= 1'b1;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                state   <= INST_LOAD;
            end

            INST_LOAD: begin
                sel     <= 1'b1;
                rd      <= 1'b1;
                ld_ir   <= 1'b1;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                state   <= IDLE;  // Chuyển sang IDLE trước khi OP_ADDR
            end
            
            IDLE: begin
                sel     <= 1'b1;
                rd      <= 1'b1;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                state   <= OP_ADDR;
            end

            OP_ADDR: begin
                sel     <= 1'b0;
                rd      <= 1'b0;
                ld_ir   <= 1'b0;
                halt    <= (opcode == HLT) ? 1'b1 : 1'b0;
                inc_pc  <= (opcode != HLT) ? 1'b1 : 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                if (opcode == HLT)
                    state <= OP_ADDR;
                else if (opcode == STO)
                    state <= STORE;
                else if (opcode == SKZ || opcode == JMP)
                    state <= INST_ADDR;
                else
                    state <= OP_FETCH;
            end

            OP_FETCH: begin
                sel     <= 1'b0;
                rd      <= (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA) ? 1'b1 : 1'b0;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                state   <= ALU_OP;
            end

            ALU_OP: begin
                sel     <= 1'b0;
                rd      <= (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA) ? 1'b1 : 1'b0;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= (opcode == JMP) ? 1'b1 : 1'b0;
                wr      <= 1'b0;
                data_e  <= (opcode == STO) ? 1'b1 : 1'b0;
                state   <= STORE;
            end

            STORE: begin
                sel     <= 1'b0;
                rd      <= 1'b0;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA) ? 1'b1 : 1'b0;
                ld_pc   <= (opcode == JMP) ? 1'b1 : 1'b0;
                wr      <= (opcode == STO) ? 1'b1 : 1'b0;
                data_e  <= (opcode == STO) ? 1'b1 : 1'b0;
                state   <= INST_ADDR;
            end

            default: begin
                sel     <= 1'b0;
                rd      <= 1'b0;
                ld_ir   <= 1'b0;
                halt    <= 1'b0;
                inc_pc  <= 1'b0;
                ld_ac   <= 1'b0;
                ld_pc   <= 1'b0;
                wr      <= 1'b0;
                data_e  <= 1'b0;
                state   <= INST_ADDR;
            end
        endcase
    end
end
            
endmodule



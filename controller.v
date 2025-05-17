module controller(
    input wire clk,
    input wire rst,
    input wire is_zero,
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
parameter IDLE       = 3'd7;  // Chỉ sử dụng khi cần

parameter HLT = 3'b000;
parameter SKZ = 3'b001;
parameter ADD = 3'b010;
parameter AND = 3'b011;
parameter XOR = 3'b100;
parameter LDA = 3'b101;
parameter STO = 3'b110;
parameter JMP = 3'b111;

reg [2:0] state, next_state;

// Logic điều khiển
always @(*) begin
    // Giá trị mặc định
    sel = 1; rd = 0; ld_ir = 0; halt = 0;
    inc_pc = 0; ld_ac = 0; ld_pc = 0;
    wr = 0; data_e = 0;

    case (state)
        INST_ADDR: begin
            sel = 1;  // Chọn PC
        end
        
        INST_FETCH: begin
            sel = 1;
            rd = 1;   // Đọc lệnh từ ROM
        end
        
        INST_LOAD: begin
            sel = 1;
            rd = 1;
            ld_ir = 1;
        end

        IDLE: begin
            ld_ir = 1;
            rd = 1;
        end
        
        OP_ADDR: begin
            sel = 0;  // Chọn địa chỉ dữ liệu
            inc_pc = 1; // Tăng PC
        end
        
        OP_FETCH: begin
            sel = 0;
            rd = (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA);
        end
        
        ALU_OP: begin
            sel = 0;
            data_e = 1 ;
            case (opcode)
                ADD, AND, XOR, LDA: rd = 1;
                SKZ: inc_pc = is_zero;
            endcase
        end
        
        STORE: begin
            sel = 0;
            case (opcode)
                ADD, AND, XOR, LDA: ld_ac = 1;
                STO: begin wr = 1; data_e = 1; end
            endcase
        end
        
    endcase
end

// Chuyển trạng thái
always @(*) begin
    case (state)
        INST_ADDR: next_state = INST_FETCH;
        INST_FETCH: next_state = INST_LOAD;

        INST_LOAD: next_state = OP_ADDR; 

        OP_ADDR: begin
            if (opcode == SKZ || opcode == JMP || opcode == HLT)
                next_state = INST_ADDR;
            else if (opcode == STO) 
                next_state = STORE ;
            else
                next_state = OP_FETCH;
        end
        OP_FETCH: begin
            if (opcode == STO)
                next_state = STORE;
            else
                next_state = ALU_OP;
        end

        ALU_OP: begin
            if (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA)
                next_state = STORE;
            else
                next_state = INST_ADDR;
        end

        STORE: next_state = INST_ADDR;

        default: next_state = INST_ADDR;
    endcase
end

// Register trạng thái
always @(posedge clk or posedge rst) begin
    if (rst) 
        state <= INST_ADDR;
    else 
        state <= next_state;
end

endmodule

# Simple RISC CPU Design

## Introduction  
RISC (Reduced Instruction Set Computer) is a modern processor design approach. In this project, we design a simple RISC CPU with:  
- 3-bit opcode (8 instruction types)  
- 5-bit operand (32 address spaces)  
- Clock and reset signal operation  
- HALT instruction support  

## Requirements  
Utilize knowledge from **HDL logic design** to implement a RISC CPU on an FPGA development kit (Arty-Z7 or equivalent).  

## System Components  

### Program Counter  
- Stores program address register  
- 5-bit width  
- Rising edge clock operation  
- Active-high reset (sets to 0)  
- Supports direct loading or increment  

### Address Mux  
- Selects between instruction and operand addresses  
- Default 5-bit width  
- Parameterized for flexibility  

### Memory  
- Stores instructions and data  
- 5-bit address / 8-bit data width  
- Bidirectional data port (no simultaneous R/W)  
- Rising edge clock operation  

### Accumulator Register  
- Handles ALU data  
- 8-bit width  
- Rising edge clock operation  

### ALU (Arithmetic Logic Unit)  
- Executes operations based on 3-bit opcode  
- 8-bit operands (inA, inB)  
- 8-bit output + 1-bit zero flag (is_zero)  

#### Instruction Set  
| Opcode | Code | Operation |  
|--------|------|-----------|  
| HLT | 000 | Halt execution |  
| SKZ | 001 | Skip if zero |  
| ADD | 010 | Arithmetic addition |  
| AND | 011 | Bitwise AND |  
| XOR | 100 | Bitwise XOR |  
| LDA | 101 | Load from memory |  
| STO | 110 | Store to memory |  
| JMP | 111 | Unconditional jump |  

### Controller  
- Manages control signals  
- Rising edge clock operation  
- Synchronous active-high reset  
- Supports 8 operational states  

### Registers  
- 8-bit input  
- Synchronous active-high reset  
- Rising edge clock operation  
- Load-controlled output  

## System Functionality  
1. Fetch instructions from Memory  
2. Decode instructions  
3. Retrieve operands (if required)  
4. Execute operations  
5. Store results (Memory/Accumulator)  
6. Repeat until termination  

## Build & Run using Iverilog  

### Preparation  
```bash
sudo apt install iverilog gtkwave  
git clone https://github.com/nguyenquangnghiem/CPU_RISC.git
cd CPU_RISC
```
### Compile the design:
```bash
make compile 
make run
```

### Waveform simulations:
```bash
make wave 
```


# Simple RISC CPU Design

![RISC CPU Block Diagram](https://via.placeholder.com/800x400?text=RISC+CPU+Block+Diagram)  
*(Example CPU architecture diagram - replace with your actual image)*

## Introduction
A Reduced Instruction Set Computer (RISC) processor design implemented in HDL. This project features:
- 3-bit opcode supporting 8 instructions
- 5-bit operand (32 address spaces)
- Clock-driven operation with active-high reset
- HALT instruction for program termination

## Key Features
✔ 8-bit data bus  
✔ 32-address memory space  
✔ 8 supported instructions  
✔ FPGA implementable (Arty-Z7 compatible)  
✔ Synchronous active-high reset  

## System Architecture
```mermaid
graph TD
    PC[Program Counter] --> AMUX[Address Mux]
    AMUX --> MEM[Memory]
    MEM --> IR[Instruction Register]
    IR --> CTRL[Controller]
    CTRL --> ALU
    ACC[Accumulator] --> ALU
    ALU --> ACC
    MEM --> ALU

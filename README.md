# RISC CPU Architecture Overview

## INTRODUCE
A **RISC (Reduced Instruction Set Computer) CPU** is designed to execute a minimal set of simple instructions with high efficiency, ensuring sequential program execution based on simplified processing principles. The CPU performs the following core operations:
### Opcode Table and Operations

| Opcode | Code | Operation | Output     |
|--------|------|-----------|------------|
| **HLT** | 000  | Halt program execution                     | `inA`          |
| **SKZ** | 001  | Check ALU result: if zero, skip next instruction; otherwise, continue normally | `inA`          |
| **ADD** | 010  | Add value in Accumulator with value from memory address in instruction, result goes to Accumulator | `inA + inB`     |
| **AND** | 011  | Perform bitwise AND between Accumulator and value from memory, result goes to Accumulator | `inA AND inB`   |
| **XOR** | 100  | Perform bitwise XOR between Accumulator and value from memory, result goes to Accumulator | `inA XOR inB`   |
| **LDA** | 101  | Load value from memory address in instruction into Accumulator | `inB`          |
| **STO** | 110  | Store data from Accumulator to memory address in instruction | `inA`          |
| **JMP** | 111  | Unconditional jump to target address in instruction and continue program execution | `inA`         |

## DECRIPTION OF BLOCK
### Program Counter
**PC** is an important conuter uses to count the number of program instructions. Also can count state of program 


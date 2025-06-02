# RISC CPU Architecture Overview

## INTRODUCE
A **RISC (Reduced Instruction Set Computer) CPU** is designed to execute a minimal set of simple instructions with high efficiency, ensuring sequential program execution based on simplified processing principles. The CPU performs the following core operations:
|Opcode|Code|Operation|Output|
|----------------------------|
|**HLT**|000|Halts program execution|inA|
|**SKZ**|001|the first checks ALU result : Skips next instruction if zero,
             otherwise continues normal execution |inA|
|**ADD**|010|Adds memory data to accomulator data, 
             stores result into accomulator. |inA|
|**AND**|011|ANDS memory data to accomulator data, stores result into accomulator. |inA|
|**XOR**|100|XORS memory data to accomulator data, stores result into accomulator. |intA|

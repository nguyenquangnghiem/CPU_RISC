# RISC CPU Architecture Overview

A **RISC (Reduced Instruction Set Computer) CPU** is designed to execute a minimal set of simple instructions with high efficiency, ensuring sequential program execution based on simplified processing principles. The CPU performs the following core operations:

1. **Fetch Instruction**  
   - Retrieves the next instruction from memory.

2. **Decode Instruction**  
   - Interprets the fetched instruction to determine the operation.

3. **Fetch Operand Data**  
   - Loads required data from memory (if applicable).

4. **Execute Instruction**  
   - Performs the decoded operation (e.g., arithmetic, logic).

5. **Store Result**  
   - Writes the output back to memory or registers.

6. **Execution Flow Management**  
   - The **Program Counter (PC)** tracks the current instruction address.  
   - The **Address Multiplexer (Address Mux)** and **Controller** coordinate to load the next instruction into the **Instruction Register (IR)**.

## Key Features
- **Simplified Pipeline**: Each stage (fetch/decode/execute) is optimized for single-cycle completion.  
- **Hardwired Control Unit**: Eliminates microcode overhead for faster operations.  
- 

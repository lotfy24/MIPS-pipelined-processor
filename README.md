# 🚀 Pipelined MIPS Processor RTL Implementation

<img width="1318" height="652" alt="image" src="https://github.com/user-attachments/assets/136109f4-f886-4da9-935d-b9740c2f5e9d" />

## 📋 Overview

This repository contains a Register-Transfer Level (RTL) implementation of a **pipelined MIPS processor** designed in Verilog.  
The processor implements a classic five-stage pipeline (Instruction Fetch, Instruction Decode, Execute, Memory Access, Writeback) and includes a hazard detection and forwarding unit to handle data and control hazards efficiently.

The included testbench runs a 25-instruction MIPS program to verify functionality, covering arithmetic, logic, memory, and branching instructions.

---

## ✨ Features

- Five-stage pipelined architecture (IF, ID, EX, MEM, WB)  
- Support for MIPS instructions: R-type, I-type, Load/Store, Branches  
- Hazard detection and forwarding unit for pipeline stalls and data hazards  
- Verilog RTL with modular design  
- Testbench with memory initialization files for simulation  

---


## 📝 Supported MIPS Instructions and Opcodes

| Instruction | Opcode (6-bit) | Type   |
|-------------|----------------|--------|
| add         | 000000         | R-type |
| sub         | 000000         | R-type |
| and         | 000000         | R-type |
| or          | 000000         | R-type |
| nor         | 000000         | R-type |
| xor         | 000000         | R-type |
| sll         | 000000         | R-type |
| srl         | 000000         | R-type |
| sra         | 000000         | R-type |
| slt         | 000000         | R-type |
| lw          | 100011         | I-type |
| sw          | 101011         | I-type |
| beq         | 000100         | I-type |
| bne         | 000101         | I-type |
| addi        | 001000         | I-type |
| andi        | 001100         | I-type |
| ori         | 001101         | I-type |
| slti        | 001010         | I-type |
| lui         | 001111         | I-type |
| xori        | 001110         | I-type |

---

Initial release with a 25-instruction test program and 40-cycle simulation testbench.

---

Thank you for checking out this MIPS processor RTL implementation! 🛠️  
Happy Verilog coding! 💻

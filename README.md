# 🚀 Pipelined MIPS Processor RTL Implementation

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

| Instruction | Opcode (6-bit) | Type   | Description                   |
|-------------|----------------|--------|-------------------------------|
| add         | 000000         | R-type | Add                          |
| sub         | 000000         | R-type | Subtract                     |
| and         | 000000         | R-type | Bitwise AND                  |
| or          | 000000         | R-type | Bitwise OR                   |
| nor         | 000000         | R-type | Bitwise NOR                  |
| xor         | 000000         | R-type | Bitwise XOR                  |
| sll         | 000000         | R-type | Shift Left Logical           |
| srl         | 000000         | R-type | Shift Right Logical          |
| sra         | 000000         | R-type | Shift Right Arithmetic       |
| slt         | 000000         | R-type | Set on Less Than             |
| lw          | 100011         | I-type | Load Word                   |
| sw          | 101011         | I-type | Store Word                  |
| beq         | 000100         | I-type | Branch if Equal             |
| bne         | 000101         | I-type | Branch if Not Equal         |
| addi        | 001000         | I-type | Add Immediate               |
| andi        | 001100         | I-type | AND Immediate               |
| ori         | 001101         | I-type | OR Immediate                |
| slti        | 001010         | I-type | Set Less Than Immediate     |
| lui         | 001111         | I-type | Load Upper Immediate        |
| xori        | 001110         | I-type | XOR Immediate               |

---

Initial release with a 25-instruction test program and 40-cycle simulation testbench.

---

Thank you for checking out this MIPS processor RTL implementation! 🛠️  
Happy Verilog coding! 💻

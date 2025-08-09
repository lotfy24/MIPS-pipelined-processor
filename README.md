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

## 🛠️ Prerequisites

- Verilog simulator supporting IEEE 1364-2005 (e.g., ModelSim, VCS, Icarus Verilog)  
- Text editor or IDE for Verilog development (e.g., VS Code, Vim)  
- Optional: MIPS assembler like MARS for creating custom instruction memory files  

---

## 📂 Directory Structure

Verify that your project has the following directory structure:

mips-processor-rtl/
├── src/
│ ├── MIPS.v
│ ├── MIPS_tb.v
│ ├── Imem.dat
│ ├── Dmem.dat
│ └── register_file.dat
├── README.md
└── LICENSE (optional)

yaml
Copy
Edit

- `src/` — Verilog source files and memory initialization data  
- `MIPS.v` — Top-level processor module  
- `MIPS_tb.v` — Testbench module  
- `Imem.dat` — Instruction memory initialization (binary format)  
- `Dmem.dat` — Data memory initialization (optional)  
- `register_file.dat` — Register file initialization (optional)  
- `README.md` — Project documentation (this file)  
- `LICENSE` — License file (optional)  

---

## 🏃 Usage and Simulation

1. **Load the project into your Verilog simulator.**  
2. **Compile the Verilog sources:**  
   - Add `MIPS.v` and `MIPS_tb.v`  
3. **Set memory initialization files:**  
   - `Imem.dat`, `Dmem.dat`, and `register_file.dat` are loaded using `$readmemb` or `$readmemh` in the testbench.  
4. **Run the simulation:**  
   - The testbench generates a clock and resets the processor.  
   - It runs the test program for 40 clock cycles.  
   - `$monitor` outputs key signals (`PC`, `Instruction`, etc.) for observation.  
5. **Check results:**  
   - Verify register and memory contents to confirm correct execution.  

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



## 🤝 Contributing

Contributions are welcome! Please fork the repository and create a branch for your feature or bug fix.  
Submit a pull request with a clear explanation of your changes.

---

## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## 📞 Contact

For any questions, issues, or suggestions, please open an issue in this repository or contact the maintainer at your.email@example.com.

---

## 📅 Release Notes

**Last Updated:** 06:38 PM EEST, Saturday, August 09, 2025  
Initial release with a 25-instruction test program and 40-cycle simulation testbench.

---

Thank you for checking out this MIPS processor RTL implementation! 🛠️  
Happy Verilog coding! 💻

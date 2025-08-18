Sequence Detector (Mealy Machine)

This project implements a Mealy Sequence Detector in Verilog that detects the sequence 1101.
It outputs a high pulse (y = 1) whenever the input stream contains the sequence 1101 (with support for overlapping sequences).

📂 Files

seq_detect_mealy.v → Verilog code for the sequence detector

tb_seq_detect_mealy.v → Testbench for simulation

dump.vcd → Waveform output file (generated after running simulation)

⚙️ How It Works

Input:

clk → Clock signal

reset → Active-high reset

x → Serial input (1 bit per clock cycle)

Output:

y → Goes high (1) for one clock cycle when 1101 is detected

Implementation style:

Mealy FSM

Four states internally (S0, S1, S2, S3)

Supports overlapping detection (e.g., input 1101101 detects twice).

▶️ Simulation
1. Install Icarus Verilog and GTKWave
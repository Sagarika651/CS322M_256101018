Problem 1 — Mealy Sequence Detector (Pattern: 1101, Overlapping)

State Diagram

![a state_diagram](Waves/State_diagram.jpg)

State Descriptions

S0 → No bits matched yet

S1 → Detected 1

S2 → Detected 11

S3 → Detected 110

From S3, if x=1, then output y=1 for one clock cycle and transition to S1 (to allow overlapping detection).

Design Specifications

FSM Type: Mealy (output depends on both state and input)

Target Pattern: 1101 (with overlapping detection enabled)

Reset: Active-high, synchronous

Output:

y pulses high for one cycle each time the pattern 1101 is detected

Repository Structure

problem1_seqdet/
seq_detect_mealy.v     # FSM RTL design
tb_seq_detect_mealy.v  # Testbench
README.md              # Documentation

waves/
state_diagram.png  # FSM diagram
waveform.png       # GTKWave simulation output

How to Compile and Run (Icarus Verilog + GTKWave)

Inside the problem1_seqdet/ folder:

Step 1: Compile
iverilog -o sim.out tb_seq_detect_mealy.v seq_detect_mealy.v

Step 2: Run Simulation
vvp sim.out
step 3: View Waveform
gtkwave dump.vcd

Testbench Details

Clock period = 10 ns (#5 clk = ~clk;)

Reset is asserted during the first few cycles

Input stream applied:
1 1 0 1 1 0 1 1 1 0 1

Simulation results dumped into dump.vcd for GTKWave visualization

Expected Output Behavior

For the input sequence 11011011101:

Pattern 1101 is detected at positions: 4, 7, 11 (1-based indexing).

At each detection, y=1 for one clock cycle.

Expected Output Table

| Cycle | Input (x) | dbg\_state | Output (y) |
| ----- | --------- | ---------- | ---------- |
| 1     | 1         | S1         | 0          |
| 2     | 1         | S2         | 0          |
| 3     | 0         | S3         | 0          |
| 4     | 1         | S1         | 1          |
| 5     | 1         | S2         | 0          |
| 6     | 0         | S3         | 0          |
| 7     | 1         | S1         | 1          |
| 8     | 1         | S2         | 0          |
| 9     | 1         | S2         | 0          |
| 10    | 0         | S3         | 0          |
| 11    | 1         | S1         | 1          |

Simulation Waveform

The GTKWave output shows:

clk → system clock

reset → synchronous active-high reset

x → input data stream

y → pulse when sequence 1101 is detected

dbg_state → FSM state transitions

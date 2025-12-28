# 🚦 Traffic Light Controller using Moore FSM (Verilog)

📌 Project Overview

This project implements a Traffic Light Controller using a Moore Finite State Machine (FSM) in Verilog HDL.
The controller simulates a real-world traffic signal with RED → GREEN → YELLOW → RED sequencing and fixed timing for each light.

The design includes:

- FSM-based controller logic

- Timing using a counter (1 Hz simulated clock)

- Verilog testbench

- Waveform-based verification using GTKWave
---
🧠 FSM Description
🔹 FSM Type

- Moore FSM

- Outputs depend only on the current state

- Safer and simpler compared to Mealy FSM

🔹 States and Timing
- State	Light Color	Duration
- S0	RED	10 seconds
- S1	GREEN	8 seconds
- S2	YELLOW	4 seconds

⏱️ Timing Details

- Clock Frequency: 1 Hz (simulated)

- Each clock pulse represents 1 second

- Internal counter tracks time spent in each state

- State transition occurs once the required count is reached
---
📁 Traffic_Light_Controller_FSM/     
│                 
├── traffic_light.v       
├── tb_traffic_light.v  
├── waveform.png           
├── state_diagram.png    
└── README.md             

---
🧾 Verilog Design Files
 
📄 traffic_light.v
 Implements the FSM with:

- State register

- Next-state logic

- Counter-based timing

- Moore-style output logic

📄 tb_traffic_light.v
- Generates clock and reset

- Dumps waveform (.vcd)

- Runs simulation long enough to observe multiple cycles

---

🧪 Simulation & Verification    
▶️ Compile and Simulate (Using Icarus Verilog):
 - iverilog -g2012 traffic_light.v tb_traffic_light.v
 - vvp a.out


 This generates the waveform file:

 - traffic_light.vcd
---
🛠 Tools Used

- Verilog HDL

- Icarus Verilog (iverilog)

- GTKWave

---

📌 Author

Akhilesh Yadav

B.Tech, ECE

FSM | Verilog | Digital Design

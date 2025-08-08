# Digital-Systems-Elevator-Project
This project aimed to put into practice the knowledge acquired during the Digital Systems Laboratory classes, as well as to explore the interaction between the FPGA and the Altera DE2 kit with the physical world.

A three-story cardboard elevator was developed, controlled by an FPGA and an Arduino Due. The FPGA code was written in VHDL using the Quartus II software, while the Arduino code was written in C++ using the Arduino IDE. Communication between them was established through the GPIO ports of the Altera DE2 kit.

![Montagem](Images/Elevator_assembly.png)

## Finite State Machine
The finite state machine (FSM) guided the code implementation by defining the states and their transition conditions, as well as the actions performed in each state.

![FSM](Images/FSM.png)

Ad1, Ad2, and Ad3 refer to the floors, where the value ‘1’ indicates that the elevator is currently on that floor. B1, B2, and B3 refer to the floor selection buttons, where the value ‘1’ indicates that a floor has been selected. M refers to the motor, with M = 1 meaning the motor is on; the rotation direction can be clockwise or counterclockwise, corresponding to the elevator moving up or down, respectively.

## Materials

- Arduino Due
- FPGA
- DC Motor
- Ultrasonic Sensor
- BC337 Transistor
- Jumpers
- Cardboard Box
- Popsicle Stick
- Plastic Gear
- Thread

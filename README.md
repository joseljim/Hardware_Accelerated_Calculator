# SOC Hardware_Accelerated_Calculator

SOC Hardware Accelerated Calculator implemented using a PS2 keyboard and an Altera DE10 Standard board. This calculator is divided into two parts. 
First, on the FPGA side which had a decoder for the keyboard where the user inputs were subsequently processed to carry out the corresponding 
operation on an ALU also designed in the FPGA. The second part of this project consisted of communicating the FPGA with the HPS (Hard Processor System) 
and in this way show the keyboard inputs as well as the results of the operations on an LCD screen which was controlled from the HPS.

## Description

* The operands and operator will be sent by the user, using a PS2 keyboard.
* The operation will be calculated using an ALU implemented on a verilog file with
the FPGA.
* The answer processed will be shown in the LCD screen with help of the HPS.
* The available operators will be: +, -, *, /

The general design is shown in Figure 1 which shows how the user will be giving the inputs of the operands and operator through the PS2 keyboard which will be connected to the DE10-Standard board, showing each of the mentioned before and also the answer of the given operation.

![re1](https://user-images.githubusercontent.com/78834111/155907015-73109a77-67a2-42dc-93c4-f485ac8e894f.png)<br />
**Fig. 1:** General interaction of the project components.

## PS2 Keyboard

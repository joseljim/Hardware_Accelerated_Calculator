//------------------------------------------------------------------------------------//
// MIT License
//
// Copyright (c) 2022 José Luis Jiménez Arévalo
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//------------------------------------------------------------------------------------//

module top(

	// Avalon memory
	
    input clk,
	 input rst,
	 input [3:0] address,
	 output [15:0] read_data,
	 
	 // PS2 - 7 Segment Ports
	 
	 input PS2Clk,
	 input datai,
	 output [6:0] SEG1,
	 output [6:0] SEG2,
	 output [6:0] SEG3,
	 output [6:0] SEG4,
	 output [6:0] SEG5,
	 output [6:0] SEG6
);

	 wire keydetect;
	 reg keycount;
	 
	 wire [15:0] op_a;
	 wire [15:0] op_b;
	 wire [15:0] op_code;
	 wire [15:0] result;
	 wire [15:0] status;
	 wire [15:0] avalon_read;
	 wire done;

	 assign read_data = avalon_read;
	 
	 assign synk = 1'b0;
	 
	 reg_slave_interface u1(.clk(clk),.rst(rst),.writeEnable(1),.a(op_a),.b(op_b),.op_code(op_code),.r(result),.status(done),.readAddress(address),.readData(avalon_read));
	 
	 ps2_7segment u2(.PS2Clk(PS2Clk),.FPGAClk(clk),.rst(~rst),.datain(datai),.key(code),.SEG1(SEG1),.SEG2(SEG2),.SEG3(SEG3),.SEG4(SEG4),.SEG5(SEG5),.SEG6(SEG6),.shift(keydetect),.a(op_a),.b(op_b),.r(result),.done(done),.operator(op_code));
	 
	 

	 
endmodule

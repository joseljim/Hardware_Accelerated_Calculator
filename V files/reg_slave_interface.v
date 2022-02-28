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

// Registers interface to communicate between the FPGA and the HPS 

module reg_slave_interface(
	input clk, 
   input rst,
	input writeEnable,
	input [15:0] a, // operand a
	input [15:0] b, // operand b
	input [15:0] op_code, // operation opcode
	input [15:0] r, // result
	input [15:0] status, // status flag
	input [3:0] readAddress,
   output [15:0] readData // data output
 	);
 	
  reg[15:0] register[4:0];
 
  always @ (posedge clk)
   begin
		if(writeEnable)
			begin
				register[0] = a;
				register[1] = b;
				register[2] = op_code;
				register[3] = r;
				register[4] = status;
			end
		else if (rst)
			begin
				register[0] = 0;
				register[1] = 0;
				register[2] = 0;
				register[3] = 0;
				register[4] = 0;
				
			end
   end
  
  assign readData = register[readAddress];
	
endmodule

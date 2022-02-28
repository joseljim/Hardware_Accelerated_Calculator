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

module alu (
	 input [15:0] a,
	 input [15:0] b,
	 input [15:0] op,
	 output reg [15:0] r
);	

parameter ALU_ADD = 16'd11, ALU_SUB = 16'd12, ALU_MULT = 16'd13, ALU_DIV = 16'd14;

always @ (*) begin
			case(op)
			
			ALU_ADD: begin
				r = a + b;
			end	
			ALU_SUB: begin
				r = a - b;
			end
			ALU_MULT: begin
				r = a * b;
			end
			ALU_DIV: begin
				r = a / b;
			end
				
			default: begin
				r = 8'bx;
			end
			endcase
	end

endmodule

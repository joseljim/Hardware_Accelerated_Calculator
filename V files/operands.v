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

// Converts the keyboard input digits into numbers up to 3 digits

module operands(
input [7:0] data, // 1st digit
input [7:0] data1,// 2nd digit
input [7:0] data2,// 3rd digit
input FPGAClk,
input op,
input [2:0] digits,
output reg [15:0] a
);


	always @(posedge FPGAClk) begin
		if(op) begin
		
			case(digits)
			
			3'd2: begin
				a <= (data*16'd1); // 1 digit
			end
			3'd3: begin
				a <= (data*16'd10) + (data1*16'd1) + (data2*16'd0); // 2 digits
			end
			3'd4: begin
				a <= (data*16'd100) + (data1*16'd10) + (data2*16'd1); // 3 digits
			end
			
			default: a <= a;
			endcase
			
		end

		else begin
			a <= a;
	end
	end
	
endmodule	

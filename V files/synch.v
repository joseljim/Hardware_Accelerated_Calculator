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

module synch(
	input PS2Clk,
	input FPGAClk,
	input rst,
	output midout,
	output [5:0] count
	);
	
	reg clr;
	wire comp20;
	wire [5:0]cout;
	reg Q1;
	reg Q2;
	
	counter c(.clk(PS2Clk),.clr(Q2),.rst(rst),.count(cout));
	assign comp20 = (cout == 32) ? 1 : 0;
	assign count = cout;

	
	//FIRST REGISTER
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			Q1 <= comp20;
		else 
			Q1 <= Q1;
	end
	
	assign midout = Q1;
	
	//SECOND REGISTER
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			Q2 <= Q1;
		else
			Q2 <= Q2;
	end
	
	
endmodule

		

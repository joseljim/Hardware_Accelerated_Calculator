module counter_3b(
	input key_pressed,
	input rst,
	output [3:0] count
	);
	
	reg[3:0] Q;
	
	always @(posedge key_pressed or posedge rst) begin
		if(rst)
			Q <= 0;
		else if(key_pressed)
			Q <= Q + 1;
		else if(Q == 3'd5)
			Q <= 0;
	end
	
	assign count = Q;
	
endmodule

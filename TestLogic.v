module TestLogic(clk, sum, op);
	input [3:0]sum;
	input clk;
	output [1:0]op;
	
	reg [1:0]state;
	assign op = state;
	
	parameter init = 2'b00, reroll = 2'b01, win = 2'b10, lose = 2'b11;
	initial begin
		state = init;
	end
	
	always @(posedge clk) begin
		if(sum == 7 | sum == 11 ) state = win;
		else if(sum == 2 | sum == 3 | sum == 12) state = lose;
		else state = reroll;
	end
	
endmodule
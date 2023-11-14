module Adder(die1, die2, sum);
	input [2:0]die1, die2;
	output [3:0]sum;
	
	
	assign sum = die1 + die2;
endmodule
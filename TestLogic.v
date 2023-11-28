module TestLogic(sum, op, reset, point);
	input [3:0]sum, point;
	input reset;
	output [1:0]op;
	
	reg [1:0]state, prev_state;
	assign op = state;
	
	parameter init = 2'b00, reroll = 2'b01, win = 2'b10, lose = 2'b11;
	initial begin
		state = init;
	end
	
	always @(sum, reset) begin
		//reset state
		if(reset) state = init;

		//determine state if win/loss based on roll
		case(state)
			init: begin
				if(sum == 7 | sum == 11 ) state = win;
				else if(sum == 2 | sum == 3 | sum == 12) state = lose;
				else state = reroll;
			end 
			win: state = init;
			lose: state = init;
			reroll: begin
				if(sum == point) state = win;
				else if(sum == 7) state = lose;
				else state = reroll;
			end
		endcase
	end
	
endmodule
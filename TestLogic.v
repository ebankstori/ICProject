module TestLogic(roll, sum, op, reset, point);
	input [3:0]sum, point;
	input reset, roll;
	output [1:0]op;
	
	reg [1:0]state, prev_state;
	assign op = state;
	
	parameter init = 2'b00, reroll = 2'b01, win = 2'b10, lose = 2'b11;
	
	initial begin
		state = init;
	end
	

		
	always @(posedge roll or posedge reset) begin
		
		if(reset) state = init;
		else if(sum == 4'd0) state = init;
		else begin
        	case(state)
				reroll: begin
					if(sum == point) state = win;
					else if(sum == 4'd7) state = lose;
					else state = reroll;
				end
				init: begin
					if(sum == 4'd0) state = init;
					if(sum == 4'd7 | sum == 4'd11 ) state = win;
					else if(sum == 4'd2 | sum == 4'd3 | sum == 4'd12) state = lose;
					else state = reroll;
				end 
				win: state = init;
				lose: state = init;

			endcase
			end

	end

	
endmodule
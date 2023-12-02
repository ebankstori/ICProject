module FSM(clock, roll, reset, disp1, disp2, win, loss);
	input roll, reset, clock;
	output [6:0]disp1, disp2;
	output win, loss;
	
	wire [2:0] die[0:1]; /*synthesis keep*/
	wire [1:0] result; /*synthesis keep*/
	wire [3:0] roll_sum; /*synthesis keep*/
	
	reg [3:0] point, test_sum;
	reg [2:0] die_roll[0:1];
	reg win_LED, lose_LED;
	
	parameter init = 2'b00, reroll = 2'b01, wins = 2'b10, loses = 2'b11;
	
	initial begin
		test_sum = 4'd0;
		die_roll[0] = 3'd7;
		die_roll[1] = 3'd7;
	end
	
	assign win = win_LED;
	assign loss = lose_LED;
	reg enter;
	reg update;

	always @(posedge roll or posedge !reset) begin
		
		if(roll) begin
			enter = roll;
			point <= test_sum;
			
			die_roll[0] <= die[0];
			die_roll[1] <= die[1];
			
			test_sum <= roll_sum;
		
		end 
		if(!reset) begin
			die_roll[0] = 3'd7;
			die_roll[1] = 3'd7;
		end 
		
		
   end
	

	TestLogic test(roll, test_sum, result, reset, point);
	counters dice(clock, reset, die[0], die[1]);
	Adder sum(die_roll[0], die_roll[1], roll_sum);
	bcd7seg display1(clock, die_roll[0], disp1);
	bcd7seg display2(clock, die_roll[1], disp2);

		
	always @(result or !reset) begin
		
		if(result == wins) begin
			win_LED = 1'b1;
			lose_LED = 1'b0;
		end else if(result == loses) begin
			win_LED = 1'b0;
			lose_LED = 1'b1;
		end else begin
			win_LED = 1'b0;
			lose_LED = 1'b0;
		end 
	end
	
	
	
	
endmodule
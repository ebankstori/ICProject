module FSM(clock, roll, reset, disp1, disp2, win, loss, disp5, disp4);
	input roll, reset, clock;
	output [6:0]disp1, disp2;
	output reg [6:0]disp5, disp4;
	output win, loss;
	
	wire [2:0] die[0:1]; 
	wire [1:0] result; 
	wire [3:0] roll_sum, test_sum; 
	
	reg [3:0] point;
	reg [2:0] die_roll[0:1];
	reg [2:0] disp_val[0:1];
	reg win_LED, lose_LED;
	
	parameter init = 2'b00, reroll = 2'b01, wins = 2'b10, loses = 2'b11;
	
	initial begin
		//test_sum = 4'd0;
		disp_val[0] = 3'd7;
		disp_val[1] = 3'd7;
		
		die_roll[0] = 3'd0;
		die_roll[1] = 3'd0;
	end
	
	assign win = win_LED;
	assign loss = lose_LED;
	reg enter;
	reg update;
	
	always @* begin
		case(result) 
			init: begin
				disp5 = 7'b0101111; //r
				disp4 = 7'b0100011; //o
			end
			reroll: begin
				disp5 = 7'b0101111; //r
				disp4 = 7'b0101111; //r
			end
			wins: begin
				disp5 = 7'b1100011; //u
				disp4 = 7'b1100011; //u
			end
			loses: begin
				disp5 = 7'b1111001; //l
				disp4 = 7'b0100011; //o
			end
		endcase
	end

	always @(posedge roll or posedge reset) begin
		
		if(roll) begin
			enter = roll;	
			die_roll[0] = die[0];
			die_roll[1] = die[1];
			
			disp_val[0] = die_roll[0];
			disp_val[1] = die_roll[1];
			
		end 
		if(reset) begin
			disp_val[0] = 3'd7;
			disp_val[1] = 3'd7;
			
			die_roll[0] = 3'd0;
			die_roll[1] = 3'd0;
		end 
		
		
   end

   always @(posedge roll) begin
			point <= roll_sum;
   end
	

	TestLogic test(roll, roll_sum, result, reset, point);
	counters dice(clock, reset, die[0], die[1]);
	Adder sum(die_roll[0], die_roll[1], roll_sum);
	bcd7seg display1(update, disp_val[0], disp1);
	bcd7seg display2(update, disp_val[1], disp2);

		
	always @(result) begin
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
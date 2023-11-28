module DiceGame(starting_roll, reset, clk, rst, segdisp_1, segdisp_2, win, lose, dice1_out, dice2_out);

  input starting_roll; // dice roll input signal
  input reset; // input reset for game state
  input clk; // clock input
  input rst; // reset input for counters
  output reg [6:0] segdisp_1; // output for first 7-seg display
  output reg [6:0] segdisp_2; // output for second 7-seg display
  output reg win; // output - indicates player has won
  output reg lose; // output - indicated player has lost
  output reg [2:0] dice1_out; // output - vaue of die 1
  output reg [2:0] dice2_out; // output - value of die 2


  reg [2:0] dice1_counter; // register representing value of die 1
  reg [2:0] dice2_counter; // register representing value of die 2
  reg rolling; // register to indicate the dice are currently rolling

  // instantiate the counters module
  counters uut (
    .clk(clk),
    .rst(rst),
    .dice1_out(),
    .dice2_out()
  );

  always @(posedge reset or posedge starting_roll)
  // trigger on the + clock edge or + edge of rst signal
  begin
    if (reset)
	 // on a + edge of reset, variables are initialzied
    begin
      dice1_counter <= 3'b000;
      dice2_counter <= 3'b000;
      segdisp_1 <= 7'b0000000;
      segdisp_2 <= 7'b0000000;
      rolling <= 1'b0;
      win <= 1'b0;
      lose <= 1'b0;
    end
    else if (starting_roll)
	 // on a + edge of starting_roll, flag is set to rolling
    begin
      rolling <= 1'b1;
    end
    else if (rolling)
    begin
      // if rolling, the values of dice are displated on 7-seg displays
      segdisp_1 <= dice1_counter;
      segdisp_2 <= dice2_counter;
    end
    else
    begin
      // check if the player has won or lost
      case (dice1_counter + dice2_counter)
        4'b0011: lose <= 1'b1; // sum is 2
        4'b0100: lose <= 1'b1; // sum is 3
        4'b0110: lose <= 1'b1; // sum is 4
        4'b0111: lose <= 1'b1; // sum is 5
        4'b1000: lose <= 1'b1; // sum is 6
		  4'b0101: win <= 1'b1;  // sum is 7
        4'b1010: lose <= 1'b1; // sum is 8
        4'b1011: lose <= 1'b1; // sum is 9
        4'b1100: lose <= 1'b1; // sum is 10
		  4'b1001: win <= 1'b1;  // sum is 11
        4'b1101: win <= 1'b1;  // sum is 12
        default: rolling <= 1'b0; // continue rolling
      endcase
    end
  end

endmodule

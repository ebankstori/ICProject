`timescale 1ns/1ns

module testbench;

  parameter period = 10; // clock period in ns

  reg clk; // input clock signal
  reg rst; // input reset signal 
  reg starting_roll; //input starting_roll signal
  wire [2:0] dice1_out; // output from dice 1 
  wire [2:0] dice2_out; // output from dice 2

  wire [6:0] segdisp_1; // first 7-seg display output
  wire [6:0] segdisp_2; // second 7-seg display output
  wire win; // win output
  wire lose; // lose output


  // instantiate DiceGame module
  DiceGame cct (
    .starting_roll(starting_roll),
    .reset(rst),
    .clk(clk),
    .rst(rst),
    .segdisp_1(segdisp_1),
    .segdisp_2(segdisp_2),
    .win(win),
    .lose(lose),
    .dice1_out(dice1_out),
    .dice2_out(dice2_out)
  );

  // instantiate counters module
  counters uut (
    .clk(clk),
    .rst(rst),
    .dice1_out(dice1_out),
    .dice2_out(dice2_out)
  );

  // generate a clock
  always #((period / 2)) clk = ~clk;


  initial begin
  // initialize values for clk, rst, starting_roll
    clk = 0;
    rst = 1;
    starting_roll = 0;

    // apply reset after 10 ns
    #10 rst = 0;

		// Test case 1: Normal game
    #20 starting_roll = 1;
    #30 starting_roll = 0; // Allow some time for counters to increment
    #40 starting_roll = 1;
    #50 starting_roll = 0; // Allow some time for counters to increment
    #60 starting_roll = 1;
    #70 starting_roll = 0; // Allow some time for counters to increment
    #80 starting_roll = 1;
    #90 starting_roll = 0; // Allow some time for counters to increment

    // Test case 2: Win condition
    #10 rst = 1;
    #20 starting_roll = 1;
    #30 starting_roll = 0; // Allow some time for counters to increment
    #40 starting_roll = 1;
    #50 starting_roll = 0; // Allow some time for counters to increment
    #60 starting_roll = 1;
    #70 starting_roll = 0; // Allow some time for counters to increment
    #80 starting_roll = 1;
    #90 starting_roll = 0; // Allow some time for counters to increment

    // Test case 3: Lose condition  
    #10 rst = 1;
    #20 starting_roll = 1;
    #30 starting_roll = 0; // Allow some time for counters to increment
    #40 starting_roll = 1;
    #50 starting_roll = 0; // Allow some time for counters to increment
    #60 starting_roll = 1;
    #70 starting_roll = 0; // Allow some time for counters to increment
    #80 starting_roll = 1;
    #90 starting_roll = 0; // Allow some time for counters to increment


    #2000 $finish;
  end

endmodule


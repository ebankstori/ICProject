`timescale 1ns / 1ps

module testbench;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [2:0] dice1_out;
    wire [2:0] dice2_out;

    // Instantiate the module
    counters uut (
        .clk(clk),
        .rst(rst),
        .dice1_out(dice1_out),
        .dice2_out(dice2_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initializations
    initial begin
        clk = 0;
        rst = 1; // Active-high reset
        #10 rst = 0; // Release reset after 10 time units
    end


endmodule
`timescale 1ns/1ps

module testbench();
    reg clk, roll, reset;
    wire [1:0] state;
    wire [6:0] disp1, disp2;
    wire win, loss;

    fsm uut(clk, roll, reset, disp1, disp2, win, loss);

    always  begin
        #10 clk = ~clk;
    end

    initial begin
        clk = 0; roll = 0; reset = 1;
        #40 reset = 0; roll = 1;
        #60 roll = 1;


    end
endmodule
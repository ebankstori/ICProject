`timescale 1ns/1ps

module testbench();
    reg [3:0] sum;
    reg clk;
    wire [1:0] state;

    TestLogic uut(clk, sum, state);

    always  begin
        #10 clk = ~clk;
    end

    initial begin
        clk = 0;
        sum = 4'b0010;

        #20 sum = 4'b0011;
        #20 sum = 4'b0100;
        #20 sum = 4'b0101;
        #20 sum = 4'b0111;
        #20 sum = 4'b1000;
        #20 sum = 4'b1001;
        #20 sum = 4'b1010;
        #20 sum = 4'b1011;
        #20 sum = 4'b1100;

    end
endmodule
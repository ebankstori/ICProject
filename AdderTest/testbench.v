`timescale 1ns/1ps

module testbench();
    wire [3:0] sum;
    reg [2:0]die1, die2;

    Adder uut(die1, die2, sum);

    initial begin
        die1 = 3'b001; die2 = 3'b001;
        #20 die1 = 3'b001; die2 = 3'b010;
        #20 die1 = 3'b001; die2 = 3'b011;
        #20 die1 = 3'b001; die2 = 3'b100;
        #20 die1 = 3'b001; die2 = 3'b101;
        #20 die1 = 3'b001; die2 = 3'b110;
        #20 die1 = 3'b101; die2 = 3'b001;
        #20 die1 = 3'b101; die2 = 3'b011;
        #20 die1 = 3'b101; die2 = 3'b100;
        #20 die1 = 3'b110; die2 = 3'b110;
        #20 die1 = 3'b101; die2 = 3'b110;

    end
endmodule
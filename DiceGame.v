module DiceGame(
    input clock,
	 input reset, // input reset
    input roll, // input starting roll
    output [6:0] disp1, //output first 7 segment display
    output [6:0] disp2, // output second 7 segment display
    output win, // output green LED for win
    output lose // output red LED for lose
);

reg reg_disp1;
reg reg_disp2;
reg reg_win;
reg reg_lose;

assign disp1 = reg_disp1;
assign disp2 = reg_disp2;
assign win = reg_win;
assign lose = reg_lose;

fsm uut (
	.clock(clock),
	.win(win),
	.lose(lose),
	.reset(reset),
	.roll(roll),
	.disp1(disp1),
	.disp2(disp2)
);

    always @(posedge clock) begin
        // display values only when the enter/roll button is released
        if (~roll) begin
            //disp1 <= win;
            //disp2 <= lose;
				reg_disp1 <= win ? 7'b1000000 : 7'b0000000; // Assuming '1' lights up the segment
            reg_disp2 <= lose ? 7'b1000000 : 7'b0000000; // Assuming '1' lights up the segment
        end
    end
// outside of always block put assign and net (output) = register, and then have seperate register 
    always @(posedge clock) begin
        // reset
        if (reset) begin
            reg_win <= 0;
            reg_lose <= 0;
        end
    end

endmodule

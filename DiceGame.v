module DiceGame(
    input clock,
	 input reset, // input reset
    input roll, // input starting roll
    output [6:0] seg_disp1, //output first 7 segment display
    output [6:0] seg_disp2, // output second 7 segment display
    output win_1, // output green LED for win
    output loss_1 // output red LED for lose
);

reg reg_seg_disp1;
reg reg_seg_disp2;
reg reg_win;
reg reg_loss;

assign seg_disp1 = reg_seg_disp1;
assign seg_disp2 = reg_seg_disp2;
assign win_1 = reg_win;
assign loss_1 = reg_loss;

fsm uut (
	.clock(clock),
	.win(reg_win),
	.loss(reg_loss),
	.reset(reset),
	.roll(roll),
	.disp1(reg_seg_disp1),
	.disp2(reg_seg_disp2)
);

    always @(posedge clock) begin
        // display values only when the enter/roll button is released
        if (~roll) begin
				reg_seg_disp1 <= disp1;
            reg_seg_disp2 <= disp2; 
        end
    end
// outside of always block put assign and net (output) = register, and then have seperate register 
    always @(posedge clock) begin
        // reset
        if (reset) begin
				reg_win <= win;
				reg_loss <= loss;
            reg_win <= 0;
            reg_loss <= 0;
        end
    end

endmodule

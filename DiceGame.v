module DiceGame(
    input clock, // input clock
	 input reset, // input reset
    input roll, // input roll
    output [6:0] seg_disp1, //output first 7 segment display
    output [6:0] seg_disp2, // output second 7 segment display
	 output [6:0] seg_disp3,
	 output [6:0] seg_disp4,
    output win_1, // output green LED for win
    output loss_1, // output red LED for lose
	 output debuge,
	 output debugr
);

reg enter, rst;
assign debuge = enter;
assign debugr = rst;

always @(!roll) begin
	enter = ! roll;
end
	
always @(!reset) begin
	rst = !reset;
end

FSM uut (
	.clock(clock),
	.win(win_1),
	.loss(loss_1),
	.reset(rst),
	.roll(enter),
	.disp1(seg_disp1),
	.disp2(seg_disp2),
	.disp5(seg_disp3),
	.disp4(seg_disp4)
);



endmodule

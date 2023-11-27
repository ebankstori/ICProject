module counters (
	input wire clk, // clock input
	input wire rst, // reset input
	input roll,
	output reg [2:0] dice1_out, // dice 1 output
	output reg [2:0] dice2_out  // dice 2 output
);

	reg [2:0] counter1; // counter for dice 1
	reg [2:0] counter2; // counter for dice 2
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// initial clock values
			counter1 <= 3'b001;
			counter2 <= 3'b010;
		end else begin
			// incrementing on each clock edge
			counter1 <= counter1 + 1'b1;
			counter2 <= counter2 + 1'b1;
		end
	end
	
	always @(roll) begin // mapping 3 bit counters to 1-6 range
		dice1_out = counter1 + 1'b1;
		dice2_out = counter2 + 1'b1;
	end
	
endmodule

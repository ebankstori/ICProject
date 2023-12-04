module bcd7seg (clock, bcd, display);
	input clock;
	input [2:0] bcd;
	output reg [0:6] display;

	/*
	*    ---
	*   | 0 |
	* 5 |   | 1
	*   |   |
	*    ---
	*   | 6 |
	* 4 |   | 2
	*   |   |
	*    ---
	*     3
	*/
        
always @(bcd)
	case (bcd)
			0: display = 7'b1000000;
			1: display = 7'b1111001;
			2: display = 7'b0100100;
			3: display = 7'b0110000;
			4: display = 7'b0011001;
			5: display = 7'b0010010;
			6: display = 7'b0000010;
		default: display = 7'b0111111;
	endcase
endmodule





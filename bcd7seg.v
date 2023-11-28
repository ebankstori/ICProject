module bcd7seg (bcd, display);
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
		3'h0: display = 7'b0000001;
		3'h1: display = 7'b1001111;
		3'h2: display = 7'b0010010;
		3'h3: display = 7'b0000110;
		3'h4: display = 7'b1001100;
		3'h5: display = 7'b0100100;
		3'h6: display = 7'b1100000;
		default: display = 7'bx;
	endcase
endmodule

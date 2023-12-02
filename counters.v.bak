module counters (clk, rst, dice1_out, dice2_out);
    input wire clk; // clock input
    input wire rst; // reset input
    output reg [2:0] dice1_out; // dice 1 output
    output reg [2:0] dice2_out;  // dice 2 output

    reg [15:0] lfsr; // 16-bit linear feedback shift register

    always @(posedge clk or posedge rst) begin 
	 // trigger on the + clock edge or + edge of rst signal
        if (rst) begin
            lfsr <= 16'hACE1; // if rst, then LFSR is initialized to 16'hACE1
        end else begin // if not rst...
            lfsr[0] <= lfsr[0] ^ lfsr[2] ^ lfsr[3] ^ lfsr[5]; // LFSR is shifted to the left
            lfsr[15:1] <= lfsr[14:0]; // entire LFSR is shifted left and updated
        end
    end

    always @* begin // combinational always: block triggers whenever any input changes
        dice1_out = lfsr[3:1] + 1; // extract 3:1 bits from LFSR and increment by 1
        dice2_out = lfsr[7:5] + 1; // extract 7:5 bits from LFSR and increment by 1
    end

endmodule

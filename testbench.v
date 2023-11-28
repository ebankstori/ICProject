module testbench;
    reg clock;
    reg reset;
    reg roll;
    wire [6:0] disp1;
    wire [6:0] disp2;
    wire win;
    wire lose;

    // Instantiate the DiceGame module
    DiceGame uut (
        .clock(clock),
        .reset(reset),
        .roll(roll),
        .disp1(disp1),
        .disp2(disp2),
        .win(win),
        .lose(lose)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    
    initial begin
        reset = 1;
        roll = 0;

        #10 reset = 0;

        #10 roll = 1;

        #100;

        roll = 0;

        #100;

        reset = 1;

        #10 $finish;
    end
endmodule

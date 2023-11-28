onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/disp1
add wave -noupdate /testbench/disp2
add wave -noupdate /testbench/loss
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/roll
add wave -noupdate /testbench/state
add wave -noupdate /testbench/win
add wave -noupdate /testbench/uut/die
add wave -noupdate /testbench/uut/die_roll
add wave -noupdate /testbench/uut/lose
add wave -noupdate /testbench/uut/loss
add wave -noupdate /testbench/uut/result
add wave -noupdate /testbench/uut/roll_sum
add wave -noupdate /testbench/uut/test_sum
add wave -noupdate /testbench/uut/test/op
add wave -noupdate /testbench/uut/test/point
add wave -noupdate /testbench/uut/test/reset
add wave -noupdate /testbench/uut/test/state
add wave -noupdate /testbench/uut/test/sum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {129185 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {350050 ps}

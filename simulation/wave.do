onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mpu_tb/clock
add wave -noupdate /mpu_tb/reset
add wave -noupdate /mpu_tb/mpu/regfile_out1
add wave -noupdate /mpu_tb/mpu/regfile_out2
add wave -noupdate /mpu_tb/mpu/alubuf1_out
add wave -noupdate /mpu_tb/mpu/alubuf2_out
add wave -noupdate /mpu_tb/mpu/alu_out
add wave -noupdate /mpu_tb/mpu/rf_write
add wave -noupdate /mpu_tb/mpu/alubuf1_load
add wave -noupdate /mpu_tb/mpu/alubuf2_load
add wave -noupdate /mpu_tb/mpu/alu_op
add wave -noupdate /mpu_tb/mpu/fsm/cstate
add wave -noupdate /mpu_tb/mpu/decoder/rf_reg1
add wave -noupdate /mpu_tb/mpu/decoder/rf_reg2
add wave -noupdate /mpu_tb/mpu/decoder/rf_regw
add wave -noupdate /mpu_tb/mpu/decoder/alu_op
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14800 ps} 0}
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
WaveRestoreZoom {0 ps} {258 ns}

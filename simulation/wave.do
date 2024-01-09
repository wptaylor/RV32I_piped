onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mpu_tb/clock
add wave -noupdate /mpu_tb/reset
add wave -noupdate -radix decimal /mpu_tb/mpu/regfile_out1
add wave -noupdate -radix decimal /mpu_tb/mpu/regfile_out2
add wave -noupdate -radix binary /mpu_tb/mpu/alubuf1_out
add wave -noupdate -radix binary -childformat {{{/mpu_tb/mpu/alubuf2_out[31]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[30]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[29]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[28]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[27]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[26]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[25]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[24]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[23]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[22]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[21]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[20]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[19]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[18]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[17]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[16]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[15]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[14]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[13]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[12]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[11]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[10]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[9]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[8]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[7]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[6]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[5]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[4]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[3]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[2]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[1]} -radix decimal} {{/mpu_tb/mpu/alubuf2_out[0]} -radix decimal}} -subitemconfig {{/mpu_tb/mpu/alubuf2_out[31]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[30]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[29]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[28]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[27]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[26]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[25]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[24]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[23]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[22]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[21]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[20]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[19]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[18]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[17]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[16]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[15]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[14]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[13]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[12]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[11]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[10]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[9]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[8]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[7]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[6]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[5]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[4]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[3]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[2]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[1]} {-height 15 -radix decimal} {/mpu_tb/mpu/alubuf2_out[0]} {-height 15 -radix decimal}} /mpu_tb/mpu/alubuf2_out
add wave -noupdate -radix binary /mpu_tb/mpu/alu_out
add wave -noupdate /mpu_tb/mpu/rf_write
add wave -noupdate /mpu_tb/mpu/alubuf1_load
add wave -noupdate /mpu_tb/mpu/alubuf2_load
add wave -noupdate /mpu_tb/mpu/alu_op
add wave -noupdate /mpu_tb/mpu/fsm/cstate
add wave -noupdate -radix unsigned /mpu_tb/mpu/decoder/rf_reg1
add wave -noupdate -radix unsigned /mpu_tb/mpu/decoder/rf_reg2
add wave -noupdate -radix unsigned /mpu_tb/mpu/decoder/rf_regw
add wave -noupdate /mpu_tb/mpu/decoder/alu_op
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 194
configure wave -valuecolwidth 86
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
WaveRestoreZoom {0 ps} {246300 ps}

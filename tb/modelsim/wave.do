onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ddr3_top_tb/CLKIN_PERIOD
add wave -noupdate /ddr3_top_tb/RESET_PERIOD
add wave -noupdate /ddr3_top_tb/sys_rst_n
add wave -noupdate /ddr3_top_tb/sys_rst
add wave -noupdate /ddr3_top_tb/sys_clk_i
add wave -noupdate /ddr3_top_tb/sys_clk_p
add wave -noupdate /ddr3_top_tb/sys_clk_n
add wave -noupdate /ddr3_top_tb/ddr3_reset_n
add wave -noupdate /ddr3_top_tb/ddr3_dq
add wave -noupdate /ddr3_top_tb/ddr3_dqs_p
add wave -noupdate /ddr3_top_tb/ddr3_dqs_n
add wave -noupdate /ddr3_top_tb/ddr3_addr
add wave -noupdate /ddr3_top_tb/ddr3_ba
add wave -noupdate /ddr3_top_tb/ddr3_ras_n
add wave -noupdate /ddr3_top_tb/ddr3_cas_n
add wave -noupdate /ddr3_top_tb/ddr3_we_n
add wave -noupdate /ddr3_top_tb/ddr3_cke
add wave -noupdate /ddr3_top_tb/ddr3_ck_p
add wave -noupdate /ddr3_top_tb/ddr3_ck_n
add wave -noupdate /ddr3_top_tb/init_calib_complete
add wave -noupdate /ddr3_top_tb/tg_compare_error
add wave -noupdate /ddr3_top_tb/ddr3_cs_n
add wave -noupdate /ddr3_top_tb/ddr3_dm
add wave -noupdate /ddr3_top_tb/ddr3_odt
add wave -noupdate /ddr3_top_tb/app_addr
add wave -noupdate /ddr3_top_tb/app_cmd
add wave -noupdate /ddr3_top_tb/app_en
add wave -noupdate /ddr3_top_tb/app_wdf_data
add wave -noupdate /ddr3_top_tb/app_wdf_end
add wave -noupdate /ddr3_top_tb/app_wdf_wren
add wave -noupdate /ddr3_top_tb/app_rd_data
add wave -noupdate /ddr3_top_tb/app_rd_data_end
add wave -noupdate /ddr3_top_tb/app_rd_data_valid
add wave -noupdate /ddr3_top_tb/app_rdy
add wave -noupdate /ddr3_top_tb/app_wdf_rdy
add wave -noupdate /ddr3_top_tb/app_sr_active
add wave -noupdate /ddr3_top_tb/app_ref_ack
add wave -noupdate /ddr3_top_tb/app_zq_ack
add wave -noupdate /ddr3_top_tb/clk
add wave -noupdate /ddr3_top_tb/rst
add wave -noupdate /ddr3_top_tb/app_wdf_mask
add wave -noupdate /ddr3_top_tb/device_temp_i
add wave -noupdate /ddr3_top_tb/device_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {0 fs} {1 ps}

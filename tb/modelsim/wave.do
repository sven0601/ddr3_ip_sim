onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider add_drv
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/ui_clk
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/app_addr
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_cmd
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_en
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_rdy
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/app_wdf_data
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_wdf_mask
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_wdf_rdy
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_wdf_wren
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_wdf_end
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/app_rd_data
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_rd_data_valid
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/test_start
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/test_busy
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/error_num
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/error_done
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/bl_cnt
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/cmd_cnt
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/wr_addr
add wave -noupdate /ddr3_top_tb/u_ddr3_app_drv/app_en_r
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/wr_cnt
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/rd_cnt
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/rd_addr
add wave -noupdate -radix unsigned -radixshowbase 0 /ddr3_top_tb/u_ddr3_app_drv/check_data
add wave -noupdate -divider ddr3
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_dq
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_dqs_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_dqs_p
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_addr
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_ba
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_ras_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_cas_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_we_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_reset_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_ck_p
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_ck_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_cke
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_cs_n
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_dm
add wave -noupdate /ddr3_top_tb/u_ddr3/ddr3_odt
add wave -noupdate /ddr3_top_tb/u_ddr3/sys_clk_p
add wave -noupdate /ddr3_top_tb/u_ddr3/sys_clk_n
add wave -noupdate /ddr3_top_tb/u_ddr3/app_addr
add wave -noupdate /ddr3_top_tb/u_ddr3/app_cmd
add wave -noupdate /ddr3_top_tb/u_ddr3/app_en
add wave -noupdate /ddr3_top_tb/u_ddr3/app_wdf_data
add wave -noupdate /ddr3_top_tb/u_ddr3/app_wdf_end
add wave -noupdate /ddr3_top_tb/u_ddr3/app_wdf_mask
add wave -noupdate /ddr3_top_tb/u_ddr3/app_wdf_wren
add wave -noupdate /ddr3_top_tb/u_ddr3/app_rd_data
add wave -noupdate /ddr3_top_tb/u_ddr3/app_rd_data_end
add wave -noupdate /ddr3_top_tb/u_ddr3/app_rd_data_valid
add wave -noupdate /ddr3_top_tb/u_ddr3/app_rdy
add wave -noupdate /ddr3_top_tb/u_ddr3/app_wdf_rdy
add wave -noupdate /ddr3_top_tb/u_ddr3/app_sr_req
add wave -noupdate /ddr3_top_tb/u_ddr3/app_ref_req
add wave -noupdate /ddr3_top_tb/u_ddr3/app_zq_req
add wave -noupdate /ddr3_top_tb/u_ddr3/app_sr_active
add wave -noupdate /ddr3_top_tb/u_ddr3/app_ref_ack
add wave -noupdate /ddr3_top_tb/u_ddr3/app_zq_ack
add wave -noupdate /ddr3_top_tb/u_ddr3/ui_clk
add wave -noupdate /ddr3_top_tb/u_ddr3/ui_clk_sync_rst
add wave -noupdate /ddr3_top_tb/u_ddr3/init_calib_complete
add wave -noupdate /ddr3_top_tb/u_ddr3/device_temp_i
add wave -noupdate /ddr3_top_tb/u_ddr3/device_temp
add wave -noupdate /ddr3_top_tb/u_ddr3/sys_rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54960734692 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 97
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
WaveRestoreZoom {54931519470 fs} {55055372780 fs}

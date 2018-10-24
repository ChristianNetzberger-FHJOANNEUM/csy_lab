onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/U_0/fifo_rd
add wave -noupdate /tb_top/U_0/fifo_rd_enable
add wave -noupdate /tb_top/U_0/fifo_rd_size
add wave -noupdate /tb_top/U_0/fifo_rdata
add wave -noupdate /tb_top/U_0/fifo_wdata
add wave -noupdate /tb_top/U_0/fifo_we
add wave -noupdate /tb_top/U_0/fifo_wr_enable
add wave -noupdate /tb_top/U_0/fifo_wr_size
add wave -noupdate /tb_top/U_0/xfer_done
add wave -noupdate /tb_top/U_0/xfer_sync_ext
add wave -noupdate /tb_top/U_0/M00_AXI_ARADDR
add wave -noupdate /tb_top/U_0/M00_AXI_ARLEN
add wave -noupdate /tb_top/U_0/M00_AXI_ARREADY
add wave -noupdate /tb_top/U_0/M00_AXI_ARSIZE
add wave -noupdate /tb_top/U_0/M00_AXI_ARVALID
add wave -noupdate /tb_top/U_0/M00_AXI_AWADDR
add wave -noupdate /tb_top/U_0/M00_AXI_AWBURST
add wave -noupdate /tb_top/U_0/M00_AXI_AWCACHE
add wave -noupdate /tb_top/U_0/M00_AXI_AWID
add wave -noupdate /tb_top/U_0/M00_AXI_AWLEN
add wave -noupdate /tb_top/U_0/M00_AXI_AWREADY
add wave -noupdate /tb_top/U_0/M00_AXI_AWSIZE
add wave -noupdate /tb_top/U_0/M00_AXI_AWVALID
add wave -noupdate /tb_top/U_0/M00_AXI_BID
add wave -noupdate /tb_top/U_0/M00_AXI_BREADY
add wave -noupdate /tb_top/U_0/M00_AXI_BRESP
add wave -noupdate /tb_top/U_0/M00_AXI_BVALID
add wave -noupdate /tb_top/U_0/M00_AXI_RDATA
add wave -noupdate /tb_top/U_0/M00_AXI_RLAST
add wave -noupdate /tb_top/U_0/M00_AXI_RREADY
add wave -noupdate /tb_top/U_0/M00_AXI_RRESP
add wave -noupdate /tb_top/U_0/M00_AXI_RUSER
add wave -noupdate /tb_top/U_0/M00_AXI_RVALID
add wave -noupdate /tb_top/U_0/M00_AXI_WDATA
add wave -noupdate /tb_top/U_0/M00_AXI_WLAST
add wave -noupdate /tb_top/U_0/M00_AXI_WREADY
add wave -noupdate /tb_top/U_0/M00_AXI_WSTRB
add wave -noupdate /tb_top/U_0/M00_AXI_WVALID
add wave -noupdate -divider {Stream Controller}
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/reset
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/fifo_rd
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/fifo_rd_size
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/fifo_wr_size
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/threshold
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_done
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_rd_en
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_wr_en
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_rd_init
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_wr_init
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/current_state
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_rd_init_cld
add wave -noupdate /tb_top/U_0/U_0/i_topcon/U_6/xfer_wr_init_cld
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {119410 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 161
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {527616 ns}

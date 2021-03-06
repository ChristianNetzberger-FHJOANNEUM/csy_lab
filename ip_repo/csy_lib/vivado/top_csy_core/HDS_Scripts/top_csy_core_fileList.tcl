set hdsFileList [list]
set ipFileList [list]
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/awgn_lutaddr_rtl.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/comp_signal_debounce_rtl.vhd"
lappend hdsFileList zybo_rtc_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/zybo_rtc_lib/hdl/i2s_master_fsm.vhd"
lappend hdsFileList zybo_rtc_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/zybo_rtc_lib/hdl/i2c_master_fsm.vhd"
lappend hdsFileList zybo_rtc_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/zybo_rtc_lib/hdl/i2c_config_fsm.vhd"
lappend hdsFileList zybo_rtc_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/zybo_rtc_lib/hdl/codec_interface_struct.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/comp_dds_rtl.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/comp_delay_rtl1.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/comp_pulsetrain_rtl.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/busdef_pkg.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/busdef_pkg_body.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/register_array_resetval_rtl.vhd"
lappend hdsFileList csy_lib
lappend hdsFileList "$::env(HDS_PROJECT_DIR)/csy_lib/hdl/top_csy_core_struct.vhd"
set vlogGlobalFileList [list]


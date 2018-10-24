-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axi_infrastructure_v1_1_0 \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies/xil_common_vip_v1_0_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/axi_protocol_checker_v1_1_14 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/a1b2/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \
-endlib
-makelib ies/axi_vip_v1_0_2 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl/axi_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/axi_vip_v1_0_1 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \
-endlib
-makelib ies/axi_mst_sbus_bridge \
  "../../../bd/system/ipshared/10de/hdl/S00_AXI.vhd" \
  "../../../bd/system/ipshared/10de/hdl/busdef_pkg.vhd" \
  "../../../bd/system/ipshared/10de/hdl/axi_xfer_ctrl_fsm.vhd" \
  "../../../bd/system/ipshared/10de/hdl/cnt_modulus_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/cnt_modulus_c_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/fifo_bram_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/fifo_distram_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/fifo_stream_ctrl_fsm.vhd" \
  "../../../bd/system/ipshared/10de/hdl/register_array_resetval_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/axi_master_control_struct.vhd" \
  "../../../bd/system/ipshared/10de/hdl/busdef_pkg_body.vhd" \
  "../../../bd/system/ipshared/10de/hdl/m00_axi_implementation.vhd" \
  "../../../bd/system/ipshared/10de/hdl/profiler_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/sbus_mux3_rtl.vhd" \
  "../../../bd/system/ipshared/10de/hdl/top_axi_mst_sbus_bridge_struct.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/system/ip/system_axi_mst_sbus_bridge_0_0/sim/system_axi_mst_sbus_bridge_0_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/hdl/bd_44e3.v" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/e870/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_5/sim/bd_44e3_s00a2s_0.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/224a/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_11/sim/bd_44e3_m00s2a_0.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/986a/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_12/sim/bd_44e3_m00e_0.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_6/sim/bd_44e3_sarn_0.sv" \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_7/sim/bd_44e3_srn_0.sv" \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_8/sim/bd_44e3_sawn_0.sv" \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_9/sim/bd_44e3_swn_0.sv" \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_10/sim/bd_44e3_sbn_0.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/5300/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_2/sim/bd_44e3_s00mmu_0.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/cbcb/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_3/sim/bd_44e3_s00tr_0.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/cc66/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib -sv \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_4/sim/bd_44e3_s00sic_0.sv" \
-endlib
-makelib ies/xlconstant_v1_1_3 \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/45df/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_0/sim/bd_44e3_one_0.v" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_11 \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_1/sim/bd_44e3_psr_aclk_0.vhd" \
  "../../../bd/system/ip/system_axi_smc_0/sim/system_axi_smc_0.vhd" \
  "../../../bd/system/ip/system_rst_ps7_0_100M_0/sim/system_rst_ps7_0_100M_0.vhd" \
  "../../../bd/system/hdl/system.vhd" \
-endlib
-makelib ies/csy_lib \
  "../../../bd/system/ipshared/afef/hdl/awgn_lutaddr_rtl.vhd" \
  "../../../bd/system/ipshared/afef/hdl/busdef_pkg.vhd" \
  "../../../bd/system/ipshared/afef/hdl/busdef_pkg_body.vhd" \
  "../../../bd/system/ipshared/afef/hdl/comp_dds_rtl.vhd" \
  "../../../bd/system/ipshared/afef/hdl/comp_delay_rtl1.vhd" \
  "../../../bd/system/ipshared/afef/hdl/comp_pulsetrain_rtl.vhd" \
  "../../../bd/system/ipshared/afef/hdl/comp_signal_debounce_rtl.vhd" \
  "../../../bd/system/ipshared/afef/hdl/register_array_resetval_rtl.vhd" \
  "../../../bd/system/ipshared/afef/hdl/top_csy_core_struct.vhd" \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/afef/hdl/comp_oneshot_rtl.vhd" \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/afef/hdl/i2c_config_fsm.vhd" \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/afef/hdl/i2c_master_fsm.vhd" \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/afef/hdl/i2s_master_fsm.vhd" \
  "../../../../project_csy.srcs/sources_1/bd/system/ipshared/afef/hdl/codec_interface_struct.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/system/ip/system_csy_core_0_0/sim/system_csy_core_0_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib


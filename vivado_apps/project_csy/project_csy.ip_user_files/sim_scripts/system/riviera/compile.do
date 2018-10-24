vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/xil_common_vip_v1_0_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v1_1_14
vlib riviera/axi_vip_v1_0_2
vlib riviera/axi_vip_v1_0_1
vlib riviera/axi_mst_sbus_bridge
vlib riviera/xlconstant_v1_1_3
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_11
vlib riviera/csy_lib

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap xil_common_vip_v1_0_0 riviera/xil_common_vip_v1_0_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v1_1_14 riviera/axi_protocol_checker_v1_1_14
vmap axi_vip_v1_0_2 riviera/axi_vip_v1_0_2
vmap axi_vip_v1_0_1 riviera/axi_vip_v1_0_1
vmap axi_mst_sbus_bridge riviera/axi_mst_sbus_bridge
vmap xlconstant_v1_1_3 riviera/xlconstant_v1_1_3
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_11 riviera/proc_sys_reset_v5_0_11
vmap csy_lib riviera/csy_lib

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_common_vip_v1_0_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v1_1_14  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/a1b2/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \

vlog -work axi_vip_v1_0_2  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl/axi_vip_v1_0_vl_rfs.sv" \

vlog -work axi_vip_v1_0_1  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \

vcom -work axi_mst_sbus_bridge -93 \
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

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_axi_mst_sbus_bridge_0_0/sim/system_axi_mst_sbus_bridge_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/hdl/bd_44e3.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/e870/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_5/sim/bd_44e3_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/224a/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_11/sim/bd_44e3_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/986a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_12/sim/bd_44e3_m00e_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_6/sim/bd_44e3_sarn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_7/sim/bd_44e3_srn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_8/sim/bd_44e3_sawn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_9/sim/bd_44e3_swn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_10/sim/bd_44e3_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/5300/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_2/sim/bd_44e3_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/cbcb/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_3/sim/bd_44e3_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/cc66/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_4/sim/bd_44e3_s00sic_0.sv" \

vlog -work xlconstant_v1_1_3  -v2k5 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/45df/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/7e3a/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/2ad9/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/6eb1/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/1d61/hdl" "+incdir+../../../../project_csy.srcs/sources_1/bd/system/ipshared/f80f/hdl/verilog" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_0/sim/bd_44e3_one_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_11 -93 \
"../../../../project_csy.srcs/sources_1/bd/system/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_1/sim/bd_44e3_psr_aclk_0.vhd" \
"../../../bd/system/ip/system_axi_smc_0/sim/system_axi_smc_0.vhd" \
"../../../bd/system/ip/system_rst_ps7_0_100M_0/sim/system_rst_ps7_0_100M_0.vhd" \
"../../../bd/system/hdl/system.vhd" \

vcom -work csy_lib -93 \
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

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_csy_core_0_0/sim/system_csy_core_0_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"


--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
--Date        : Wed Oct 24 21:14:46 2018
--Host        : KPERSM7467 running 64-bit major release  (build 9200)
--Command     : generate_target system.bd
--Design      : system
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    buttons : in STD_LOGIC_VECTOR ( 3 downto 0 );
    codec_i2c_scl : out STD_LOGIC;
    codec_i2c_sda : inout STD_LOGIC;
    codec_i2s_bclk : out STD_LOGIC;
    codec_i2s_mclk : out STD_LOGIC;
    codec_i2s_mute : out STD_LOGIC;
    codec_i2s_pbdat : out STD_LOGIC;
    codec_i2s_pblrc : out STD_LOGIC;
    codec_i2s_recdat : in STD_LOGIC;
    codec_i2s_reclrc : out STD_LOGIC;
    gpo : out STD_LOGIC_VECTOR ( 1 downto 0 );
    leds : out STD_LOGIC_VECTOR ( 3 downto 0 );
    serial_en : out STD_LOGIC;
    serial_rxd : in STD_LOGIC;
    serial_txd : out STD_LOGIC;
    sliders : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system : entity is "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_ps7_cnt=1,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of system : entity is "system.hwdef";
end system;

architecture STRUCTURE of system is
  component system_processing_system7_0_0 is
  port (
    ENET0_MDIO_MDC : out STD_LOGIC;
    ENET0_MDIO_O : out STD_LOGIC;
    ENET0_MDIO_T : out STD_LOGIC;
    ENET0_MDIO_I : in STD_LOGIC;
    SDIO0_WP : in STD_LOGIC;
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IRQ_F2P : in STD_LOGIC_VECTOR ( 0 to 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component system_processing_system7_0_0;
  component system_axi_mst_sbus_bridge_0_0 is
  port (
    M00_AXI_ACLK : in STD_LOGIC;
    M00_AXI_ARESETN : in STD_LOGIC;
    M00_AXI_ARREADY : in STD_LOGIC;
    M00_AXI_AWREADY : in STD_LOGIC;
    M00_AXI_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_BUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_BVALID : in STD_LOGIC;
    M00_AXI_RDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_RLAST : in STD_LOGIC;
    M00_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_RUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_RVALID : in STD_LOGIC;
    M00_AXI_WREADY : in STD_LOGIC;
    fifo_rd : in STD_LOGIC;
    fifo_rd_enable : in STD_LOGIC;
    fifo_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_we : in STD_LOGIC;
    fifo_wr_enable : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s00_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_arlock : in STD_LOGIC;
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s00_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_awlock : in STD_LOGIC;
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wlast : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wvalid : in STD_LOGIC;
    sbus_ack : in STD_LOGIC;
    sbus_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_i : in STD_LOGIC_VECTOR ( 99 downto 0 );
    xfer_sync_ext : in STD_LOGIC;
    M00_AXI_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_ARLOCK : out STD_LOGIC;
    M00_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_ARUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_ARVALID : out STD_LOGIC;
    M00_AXI_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_AWLOCK : out STD_LOGIC;
    M00_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_AWUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_AWVALID : out STD_LOGIC;
    M00_AXI_BREADY : out STD_LOGIC;
    M00_AXI_RREADY : out STD_LOGIC;
    M00_AXI_WDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_WLAST : out STD_LOGIC;
    M00_AXI_WSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_WUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_WVALID : out STD_LOGIC;
    clk : out STD_LOGIC;
    fifo_rd_size : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_wr_size : out STD_LOGIC_VECTOR ( 15 downto 0 );
    irq : out STD_LOGIC;
    reset : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_rlast : out STD_LOGIC;
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    sbus_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sbus_be : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sbus_rd : out STD_LOGIC;
    sbus_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sbus_we : out STD_LOGIC;
    sync_o : out STD_LOGIC_VECTOR ( 99 downto 0 );
    xfer_done : out STD_LOGIC
  );
  end component system_axi_mst_sbus_bridge_0_0;
  component system_axi_smc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 17 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 17 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC
  );
  end component system_axi_smc_0;
  component system_rst_ps7_0_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component system_rst_ps7_0_100M_0;
  component system_csy_core_0_0 is
  port (
    buttons : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    recdat : in STD_LOGIC;
    reset : in STD_LOGIC;
    sbus_ack_mst : in STD_LOGIC;
    sbus_addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sbus_be : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sbus_rd : in STD_LOGIC;
    sbus_rdata_mst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sbus_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sbus_we : in STD_LOGIC;
    serial_rxd : in STD_LOGIC;
    sliders : in STD_LOGIC_VECTOR ( 3 downto 0 );
    bclk : out STD_LOGIC;
    gpo : out STD_LOGIC_VECTOR ( 1 downto 0 );
    irq_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    leds : out STD_LOGIC_VECTOR ( 3 downto 0 );
    mclk : out STD_LOGIC;
    mute : out STD_LOGIC;
    pbdat : out STD_LOGIC;
    pblrc : out STD_LOGIC;
    reclrc : out STD_LOGIC;
    sbus_ack : out STD_LOGIC;
    sbus_addr_mst : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sbus_be_mst : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sbus_rd_mst : out STD_LOGIC;
    sbus_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sbus_wdata_mst : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sbus_we_mst : out STD_LOGIC;
    scl : out STD_LOGIC;
    serial_en : out STD_LOGIC;
    serial_txd : out STD_LOGIC;
    sda : inout STD_LOGIC
  );
  end component system_csy_core_0_0;
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_ack : STD_LOGIC;
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_addr : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_be : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_rd : STD_LOGIC;
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mst_sbus_bridge_0_sbus_mst_sbus_we : STD_LOGIC;
  signal axi_smc_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal axi_smc_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_smc_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal axi_smc_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_smc_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_BREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_BVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_M00_AXI_RLAST : STD_LOGIC;
  signal axi_smc_M00_AXI_RREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_RVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_M00_AXI_WLAST : STD_LOGIC;
  signal axi_smc_M00_AXI_WREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_WVALID : STD_LOGIC;
  signal buttons_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal csy_core_0_codec_i2c_scl : STD_LOGIC;
  signal csy_core_0_codec_i2c_sda : STD_LOGIC;
  signal csy_core_0_codec_i2s_bclk : STD_LOGIC;
  signal csy_core_0_codec_i2s_mclk : STD_LOGIC;
  signal csy_core_0_codec_i2s_mute : STD_LOGIC;
  signal csy_core_0_codec_i2s_pbdat : STD_LOGIC;
  signal csy_core_0_codec_i2s_pblrc : STD_LOGIC;
  signal csy_core_0_codec_i2s_recdat : STD_LOGIC;
  signal csy_core_0_codec_i2s_reclrc : STD_LOGIC;
  signal csy_core_0_gpo : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal csy_core_0_irq_o : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal csy_core_0_leds : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal csy_core_0_serial_en : STD_LOGIC;
  signal csy_core_0_serial_txd : STD_LOGIC;
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal rst_ps7_0_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_ps7_0_100M_peripheral_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal serial_rxd_1 : STD_LOGIC;
  signal sliders_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_BREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_RREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_WVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_clk_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_irq_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_xfer_done_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_ARUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_AWUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_WDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_WSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_M00_AXI_WUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_fifo_rd_size_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_fifo_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_fifo_wr_size_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_axi_mst_sbus_bridge_0_s00_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_s00_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_s00_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_s00_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_mst_sbus_bridge_0_sync_o_UNCONNECTED : STD_LOGIC_VECTOR ( 99 downto 0 );
  signal NLW_csy_core_0_sbus_rd_mst_UNCONNECTED : STD_LOGIC;
  signal NLW_csy_core_0_sbus_we_mst_UNCONNECTED : STD_LOGIC;
  signal NLW_csy_core_0_sbus_addr_mst_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_csy_core_0_sbus_be_mst_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_csy_core_0_sbus_wdata_mst_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_ENET0_MDIO_MDC_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_ENET0_MDIO_O_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_ENET0_MDIO_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rst_ps7_0_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ps7_0_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ps7_0_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  buttons_1(3 downto 0) <= buttons(3 downto 0);
  codec_i2c_scl <= csy_core_0_codec_i2c_scl;
  codec_i2s_bclk <= csy_core_0_codec_i2s_bclk;
  codec_i2s_mclk <= csy_core_0_codec_i2s_mclk;
  codec_i2s_mute <= csy_core_0_codec_i2s_mute;
  codec_i2s_pbdat <= csy_core_0_codec_i2s_pbdat;
  codec_i2s_pblrc <= csy_core_0_codec_i2s_pblrc;
  codec_i2s_reclrc <= csy_core_0_codec_i2s_reclrc;
  csy_core_0_codec_i2s_recdat <= codec_i2s_recdat;
  gpo(1 downto 0) <= csy_core_0_gpo(1 downto 0);
  leds(3 downto 0) <= csy_core_0_leds(3 downto 0);
  serial_en <= csy_core_0_serial_en;
  serial_rxd_1 <= serial_rxd;
  serial_txd <= csy_core_0_serial_txd;
  sliders_1(3 downto 0) <= sliders(3 downto 0);
axi_mst_sbus_bridge_0: component system_axi_mst_sbus_bridge_0_0
     port map (
      M00_AXI_ACLK => processing_system7_0_FCLK_CLK0,
      M00_AXI_ARADDR(63 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARADDR_UNCONNECTED(63 downto 0),
      M00_AXI_ARBURST(1 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARBURST_UNCONNECTED(1 downto 0),
      M00_AXI_ARCACHE(3 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARCACHE_UNCONNECTED(3 downto 0),
      M00_AXI_ARESETN => rst_ps7_0_100M_peripheral_aresetn(0),
      M00_AXI_ARID(0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARID_UNCONNECTED(0),
      M00_AXI_ARLEN(7 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARLEN_UNCONNECTED(7 downto 0),
      M00_AXI_ARLOCK => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARLOCK_UNCONNECTED,
      M00_AXI_ARPROT(2 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARPROT_UNCONNECTED(2 downto 0),
      M00_AXI_ARQOS(3 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARQOS_UNCONNECTED(3 downto 0),
      M00_AXI_ARREADY => '0',
      M00_AXI_ARSIZE(2 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARSIZE_UNCONNECTED(2 downto 0),
      M00_AXI_ARUSER(0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARUSER_UNCONNECTED(0),
      M00_AXI_ARVALID => NLW_axi_mst_sbus_bridge_0_M00_AXI_ARVALID_UNCONNECTED,
      M00_AXI_AWADDR(63 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWADDR_UNCONNECTED(63 downto 0),
      M00_AXI_AWBURST(1 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWBURST_UNCONNECTED(1 downto 0),
      M00_AXI_AWCACHE(3 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWCACHE_UNCONNECTED(3 downto 0),
      M00_AXI_AWID(0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWID_UNCONNECTED(0),
      M00_AXI_AWLEN(7 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWLEN_UNCONNECTED(7 downto 0),
      M00_AXI_AWLOCK => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWLOCK_UNCONNECTED,
      M00_AXI_AWPROT(2 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWPROT_UNCONNECTED(2 downto 0),
      M00_AXI_AWQOS(3 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWQOS_UNCONNECTED(3 downto 0),
      M00_AXI_AWREADY => '0',
      M00_AXI_AWSIZE(2 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWSIZE_UNCONNECTED(2 downto 0),
      M00_AXI_AWUSER(0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWUSER_UNCONNECTED(0),
      M00_AXI_AWVALID => NLW_axi_mst_sbus_bridge_0_M00_AXI_AWVALID_UNCONNECTED,
      M00_AXI_BID(0) => '0',
      M00_AXI_BREADY => NLW_axi_mst_sbus_bridge_0_M00_AXI_BREADY_UNCONNECTED,
      M00_AXI_BRESP(1 downto 0) => B"00",
      M00_AXI_BUSER(0) => '0',
      M00_AXI_BVALID => '0',
      M00_AXI_RDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      M00_AXI_RID(0) => '0',
      M00_AXI_RLAST => '0',
      M00_AXI_RREADY => NLW_axi_mst_sbus_bridge_0_M00_AXI_RREADY_UNCONNECTED,
      M00_AXI_RRESP(1 downto 0) => B"00",
      M00_AXI_RUSER(0) => '0',
      M00_AXI_RVALID => '0',
      M00_AXI_WDATA(63 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_WDATA_UNCONNECTED(63 downto 0),
      M00_AXI_WLAST => NLW_axi_mst_sbus_bridge_0_M00_AXI_WLAST_UNCONNECTED,
      M00_AXI_WREADY => '0',
      M00_AXI_WSTRB(7 downto 0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_WSTRB_UNCONNECTED(7 downto 0),
      M00_AXI_WUSER(0) => NLW_axi_mst_sbus_bridge_0_M00_AXI_WUSER_UNCONNECTED(0),
      M00_AXI_WVALID => NLW_axi_mst_sbus_bridge_0_M00_AXI_WVALID_UNCONNECTED,
      clk => NLW_axi_mst_sbus_bridge_0_clk_UNCONNECTED,
      fifo_rd => '0',
      fifo_rd_enable => '0',
      fifo_rd_size(15 downto 0) => NLW_axi_mst_sbus_bridge_0_fifo_rd_size_UNCONNECTED(15 downto 0),
      fifo_rdata(63 downto 0) => NLW_axi_mst_sbus_bridge_0_fifo_rdata_UNCONNECTED(63 downto 0),
      fifo_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      fifo_we => '0',
      fifo_wr_enable => '0',
      fifo_wr_size(15 downto 0) => NLW_axi_mst_sbus_bridge_0_fifo_wr_size_UNCONNECTED(15 downto 0),
      irq => NLW_axi_mst_sbus_bridge_0_irq_UNCONNECTED,
      reset => NLW_axi_mst_sbus_bridge_0_reset_UNCONNECTED,
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(17 downto 0) => axi_smc_M00_AXI_ARADDR(17 downto 0),
      s00_axi_arburst(1 downto 0) => axi_smc_M00_AXI_ARBURST(1 downto 0),
      s00_axi_arcache(3 downto 0) => axi_smc_M00_AXI_ARCACHE(3 downto 0),
      s00_axi_aresetn => rst_ps7_0_100M_peripheral_aresetn(0),
      s00_axi_arid(0) => '0',
      s00_axi_arlen(7 downto 0) => axi_smc_M00_AXI_ARLEN(7 downto 0),
      s00_axi_arlock => axi_smc_M00_AXI_ARLOCK(0),
      s00_axi_arprot(2 downto 0) => axi_smc_M00_AXI_ARPROT(2 downto 0),
      s00_axi_arqos(3 downto 0) => axi_smc_M00_AXI_ARQOS(3 downto 0),
      s00_axi_arready => axi_smc_M00_AXI_ARREADY,
      s00_axi_arregion(3 downto 0) => B"0000",
      s00_axi_arsize(2 downto 0) => axi_smc_M00_AXI_ARSIZE(2 downto 0),
      s00_axi_aruser(0) => '0',
      s00_axi_arvalid => axi_smc_M00_AXI_ARVALID,
      s00_axi_awaddr(17 downto 0) => axi_smc_M00_AXI_AWADDR(17 downto 0),
      s00_axi_awburst(1 downto 0) => axi_smc_M00_AXI_AWBURST(1 downto 0),
      s00_axi_awcache(3 downto 0) => axi_smc_M00_AXI_AWCACHE(3 downto 0),
      s00_axi_awid(0) => '0',
      s00_axi_awlen(7 downto 0) => axi_smc_M00_AXI_AWLEN(7 downto 0),
      s00_axi_awlock => axi_smc_M00_AXI_AWLOCK(0),
      s00_axi_awprot(2 downto 0) => axi_smc_M00_AXI_AWPROT(2 downto 0),
      s00_axi_awqos(3 downto 0) => axi_smc_M00_AXI_AWQOS(3 downto 0),
      s00_axi_awready => axi_smc_M00_AXI_AWREADY,
      s00_axi_awregion(3 downto 0) => B"0000",
      s00_axi_awsize(2 downto 0) => axi_smc_M00_AXI_AWSIZE(2 downto 0),
      s00_axi_awuser(0) => '0',
      s00_axi_awvalid => axi_smc_M00_AXI_AWVALID,
      s00_axi_bid(0) => NLW_axi_mst_sbus_bridge_0_s00_axi_bid_UNCONNECTED(0),
      s00_axi_bready => axi_smc_M00_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => axi_smc_M00_AXI_BRESP(1 downto 0),
      s00_axi_buser(0) => NLW_axi_mst_sbus_bridge_0_s00_axi_buser_UNCONNECTED(0),
      s00_axi_bvalid => axi_smc_M00_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => axi_smc_M00_AXI_RDATA(31 downto 0),
      s00_axi_rid(0) => NLW_axi_mst_sbus_bridge_0_s00_axi_rid_UNCONNECTED(0),
      s00_axi_rlast => axi_smc_M00_AXI_RLAST,
      s00_axi_rready => axi_smc_M00_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => axi_smc_M00_AXI_RRESP(1 downto 0),
      s00_axi_ruser(0) => NLW_axi_mst_sbus_bridge_0_s00_axi_ruser_UNCONNECTED(0),
      s00_axi_rvalid => axi_smc_M00_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => axi_smc_M00_AXI_WDATA(31 downto 0),
      s00_axi_wlast => axi_smc_M00_AXI_WLAST,
      s00_axi_wready => axi_smc_M00_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => axi_smc_M00_AXI_WSTRB(3 downto 0),
      s00_axi_wuser(0) => '0',
      s00_axi_wvalid => axi_smc_M00_AXI_WVALID,
      sbus_ack => axi_mst_sbus_bridge_0_sbus_mst_sbus_ack,
      sbus_addr(15 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_addr(15 downto 0),
      sbus_be(3 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_be(3 downto 0),
      sbus_rd => axi_mst_sbus_bridge_0_sbus_mst_sbus_rd,
      sbus_rdata(31 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_rdata(31 downto 0),
      sbus_wdata(31 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_wdata(31 downto 0),
      sbus_we => axi_mst_sbus_bridge_0_sbus_mst_sbus_we,
      sync_i(99 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      sync_o(99 downto 0) => NLW_axi_mst_sbus_bridge_0_sync_o_UNCONNECTED(99 downto 0),
      xfer_done => NLW_axi_mst_sbus_bridge_0_xfer_done_UNCONNECTED,
      xfer_sync_ext => '0'
    );
axi_smc: component system_axi_smc_0
     port map (
      M00_AXI_araddr(17 downto 0) => axi_smc_M00_AXI_ARADDR(17 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_smc_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_smc_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(7 downto 0) => axi_smc_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => axi_smc_M00_AXI_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => axi_smc_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_smc_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => axi_smc_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_smc_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_smc_M00_AXI_ARVALID,
      M00_AXI_awaddr(17 downto 0) => axi_smc_M00_AXI_AWADDR(17 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_smc_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_smc_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(7 downto 0) => axi_smc_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock(0) => axi_smc_M00_AXI_AWLOCK(0),
      M00_AXI_awprot(2 downto 0) => axi_smc_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_smc_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_smc_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_smc_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_smc_M00_AXI_AWVALID,
      M00_AXI_bready => axi_smc_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_smc_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_smc_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => axi_smc_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rlast => axi_smc_M00_AXI_RLAST,
      M00_AXI_rready => axi_smc_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_smc_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_smc_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => axi_smc_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wlast => axi_smc_M00_AXI_WLAST,
      M00_AXI_wready => axi_smc_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => axi_smc_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => axi_smc_M00_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID,
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_ps7_0_100M_peripheral_aresetn(0)
    );
csy_core_0: component system_csy_core_0_0
     port map (
      bclk => csy_core_0_codec_i2s_bclk,
      buttons(3 downto 0) => buttons_1(3 downto 0),
      clk => processing_system7_0_FCLK_CLK0,
      gpo(1 downto 0) => csy_core_0_gpo(1 downto 0),
      irq_o(1 downto 0) => csy_core_0_irq_o(1 downto 0),
      leds(3 downto 0) => csy_core_0_leds(3 downto 0),
      mclk => csy_core_0_codec_i2s_mclk,
      mute => csy_core_0_codec_i2s_mute,
      pbdat => csy_core_0_codec_i2s_pbdat,
      pblrc => csy_core_0_codec_i2s_pblrc,
      recdat => csy_core_0_codec_i2s_recdat,
      reclrc => csy_core_0_codec_i2s_reclrc,
      reset => rst_ps7_0_100M_peripheral_reset(0),
      sbus_ack => axi_mst_sbus_bridge_0_sbus_mst_sbus_ack,
      sbus_ack_mst => '0',
      sbus_addr(15 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_addr(15 downto 0),
      sbus_addr_mst(15 downto 0) => NLW_csy_core_0_sbus_addr_mst_UNCONNECTED(15 downto 0),
      sbus_be(3 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_be(3 downto 0),
      sbus_be_mst(3 downto 0) => NLW_csy_core_0_sbus_be_mst_UNCONNECTED(3 downto 0),
      sbus_rd => axi_mst_sbus_bridge_0_sbus_mst_sbus_rd,
      sbus_rd_mst => NLW_csy_core_0_sbus_rd_mst_UNCONNECTED,
      sbus_rdata(31 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_rdata(31 downto 0),
      sbus_rdata_mst(31 downto 0) => B"00000000000000000000000000000000",
      sbus_wdata(31 downto 0) => axi_mst_sbus_bridge_0_sbus_mst_sbus_wdata(31 downto 0),
      sbus_wdata_mst(31 downto 0) => NLW_csy_core_0_sbus_wdata_mst_UNCONNECTED(31 downto 0),
      sbus_we => axi_mst_sbus_bridge_0_sbus_mst_sbus_we,
      sbus_we_mst => NLW_csy_core_0_sbus_we_mst_UNCONNECTED,
      scl => csy_core_0_codec_i2c_scl,
      sda => codec_i2c_sda,
      serial_en => csy_core_0_serial_en,
      serial_rxd => serial_rxd_1,
      serial_txd => csy_core_0_serial_txd,
      sliders(3 downto 0) => sliders_1(3 downto 0)
    );
processing_system7_0: component system_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      ENET0_MDIO_I => '0',
      ENET0_MDIO_MDC => NLW_processing_system7_0_ENET0_MDIO_MDC_UNCONNECTED,
      ENET0_MDIO_O => NLW_processing_system7_0_ENET0_MDIO_O_UNCONNECTED,
      ENET0_MDIO_T => NLW_processing_system7_0_ENET0_MDIO_T_UNCONNECTED,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      IRQ_F2P(0) => csy_core_0_irq_o(0),
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      SDIO0_WP => '0',
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => '0',
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
rst_ps7_0_100M: component system_rst_ps7_0_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ps7_0_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => NLW_rst_ps7_0_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ps7_0_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_ps7_0_100M_peripheral_aresetn(0),
      peripheral_reset(0) => rst_ps7_0_100M_peripheral_reset(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
end STRUCTURE;

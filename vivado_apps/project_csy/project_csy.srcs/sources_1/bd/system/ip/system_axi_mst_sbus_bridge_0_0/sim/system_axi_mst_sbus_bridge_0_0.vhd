-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: fh-joanneum.local:user:axi_mst_sbus_bridge:1.0
-- IP Revision: 5

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_mst_sbus_bridge;
USE axi_mst_sbus_bridge.top_axi_mst_sbus_bridge;

ENTITY system_axi_mst_sbus_bridge_0_0 IS
  PORT (
    M00_AXI_ACLK : IN STD_LOGIC;
    M00_AXI_ARESETN : IN STD_LOGIC;
    M00_AXI_ARREADY : IN STD_LOGIC;
    M00_AXI_AWREADY : IN STD_LOGIC;
    M00_AXI_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_BVALID : IN STD_LOGIC;
    M00_AXI_RDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXI_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_RLAST : IN STD_LOGIC;
    M00_AXI_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_RVALID : IN STD_LOGIC;
    M00_AXI_WREADY : IN STD_LOGIC;
    fifo_rd : IN STD_LOGIC;
    fifo_rd_enable : IN STD_LOGIC;
    fifo_wdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    fifo_we : IN STD_LOGIC;
    fifo_wr_enable : IN STD_LOGIC;
    s00_axi_aclk : IN STD_LOGIC;
    s00_axi_araddr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    s00_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_aresetn : IN STD_LOGIC;
    s00_axi_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s00_axi_arlock : IN STD_LOGIC;
    s00_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_aruser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_arvalid : IN STD_LOGIC;
    s00_axi_awaddr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    s00_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s00_axi_awlock : IN STD_LOGIC;
    s00_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_awuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_awvalid : IN STD_LOGIC;
    s00_axi_bready : IN STD_LOGIC;
    s00_axi_rready : IN STD_LOGIC;
    s00_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_wlast : IN STD_LOGIC;
    s00_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_wuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_wvalid : IN STD_LOGIC;
    sbus_ack : IN STD_LOGIC;
    sbus_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sync_i : IN STD_LOGIC_VECTOR(99 DOWNTO 0);
    xfer_sync_ext : IN STD_LOGIC;
    M00_AXI_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXI_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M00_AXI_ARLOCK : OUT STD_LOGIC;
    M00_AXI_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_ARVALID : OUT STD_LOGIC;
    M00_AXI_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXI_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXI_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M00_AXI_AWLOCK : OUT STD_LOGIC;
    M00_AXI_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXI_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXI_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_AWVALID : OUT STD_LOGIC;
    M00_AXI_BREADY : OUT STD_LOGIC;
    M00_AXI_RREADY : OUT STD_LOGIC;
    M00_AXI_WDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXI_WLAST : OUT STD_LOGIC;
    M00_AXI_WSTRB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M00_AXI_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXI_WVALID : OUT STD_LOGIC;
    clk : OUT STD_LOGIC;
    fifo_rd_size : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    fifo_rdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    fifo_wr_size : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    irq : OUT STD_LOGIC;
    reset : OUT STD_LOGIC;
    s00_axi_arready : OUT STD_LOGIC;
    s00_axi_awready : OUT STD_LOGIC;
    s00_axi_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_buser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_bvalid : OUT STD_LOGIC;
    s00_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_rlast : OUT STD_LOGIC;
    s00_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_ruser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s00_axi_rvalid : OUT STD_LOGIC;
    s00_axi_wready : OUT STD_LOGIC;
    sbus_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    sbus_be : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    sbus_rd : OUT STD_LOGIC;
    sbus_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sbus_we : OUT STD_LOGIC;
    sync_o : OUT STD_LOGIC_VECTOR(99 DOWNTO 0);
    xfer_done : OUT STD_LOGIC
  );
END system_axi_mst_sbus_bridge_0_0;

ARCHITECTURE system_axi_mst_sbus_bridge_0_0_arch OF system_axi_mst_sbus_bridge_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_axi_mst_sbus_bridge_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT top_axi_mst_sbus_bridge IS
    GENERIC (
      C_M00_AXI_ADDR_WIDTH : INTEGER;
      C_M00_AXI_ARUSER_WIDTH : INTEGER;
      C_M00_AXI_AWUSER_WIDTH : INTEGER;
      C_M00_AXI_BURST_LEN : INTEGER;
      C_M00_AXI_BUSER_WIDTH : INTEGER;
      C_M00_AXI_DATA_WIDTH : INTEGER;
      C_M00_AXI_ID_WIDTH : INTEGER;
      C_M00_AXI_RUSER_WIDTH : INTEGER;
      C_M00_AXI_TARGET_SLAVE_BASE_ADDR : STD_LOGIC_VECTOR;
      C_M00_AXI_WUSER_WIDTH : INTEGER;
      C_S00_AXI_ADDR_WIDTH : INTEGER;
      C_S00_AXI_ARUSER_WIDTH : INTEGER;
      C_S00_AXI_AWUSER_WIDTH : INTEGER;
      C_S00_AXI_BUSER_WIDTH : INTEGER;
      C_S00_AXI_DATA_WIDTH : INTEGER;
      C_S00_AXI_ID_WIDTH : INTEGER;
      C_S00_AXI_RUSER_WIDTH : INTEGER;
      C_S00_AXI_WUSER_WIDTH : INTEGER;
      C_SLV_ADDR_WIDTH : INTEGER;
      C_SLV_DATA_WIDTH : INTEGER;
      C_SLOT_NUM : INTEGER;
      C_SYNC_WIDTH : INTEGER;
      C_CORE_CLK_FREQ : INTEGER
    );
    PORT (
      M00_AXI_ACLK : IN STD_LOGIC;
      M00_AXI_ARESETN : IN STD_LOGIC;
      M00_AXI_ARREADY : IN STD_LOGIC;
      M00_AXI_AWREADY : IN STD_LOGIC;
      M00_AXI_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_BVALID : IN STD_LOGIC;
      M00_AXI_RDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      M00_AXI_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_RLAST : IN STD_LOGIC;
      M00_AXI_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_RVALID : IN STD_LOGIC;
      M00_AXI_WREADY : IN STD_LOGIC;
      fifo_rd : IN STD_LOGIC;
      fifo_rd_enable : IN STD_LOGIC;
      fifo_wdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      fifo_we : IN STD_LOGIC;
      fifo_wr_enable : IN STD_LOGIC;
      s00_axi_aclk : IN STD_LOGIC;
      s00_axi_araddr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      s00_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_aresetn : IN STD_LOGIC;
      s00_axi_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s00_axi_arlock : IN STD_LOGIC;
      s00_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_aruser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_arvalid : IN STD_LOGIC;
      s00_axi_awaddr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      s00_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s00_axi_awlock : IN STD_LOGIC;
      s00_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s00_axi_awuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_awvalid : IN STD_LOGIC;
      s00_axi_bready : IN STD_LOGIC;
      s00_axi_rready : IN STD_LOGIC;
      s00_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axi_wlast : IN STD_LOGIC;
      s00_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s00_axi_wuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_wvalid : IN STD_LOGIC;
      sbus_ack : IN STD_LOGIC;
      sbus_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sync_i : IN STD_LOGIC_VECTOR(99 DOWNTO 0);
      xfer_sync_ext : IN STD_LOGIC;
      M00_AXI_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      M00_AXI_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      M00_AXI_ARLOCK : OUT STD_LOGIC;
      M00_AXI_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_ARVALID : OUT STD_LOGIC;
      M00_AXI_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      M00_AXI_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXI_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      M00_AXI_AWLOCK : OUT STD_LOGIC;
      M00_AXI_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M00_AXI_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M00_AXI_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_AWVALID : OUT STD_LOGIC;
      M00_AXI_BREADY : OUT STD_LOGIC;
      M00_AXI_RREADY : OUT STD_LOGIC;
      M00_AXI_WDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      M00_AXI_WLAST : OUT STD_LOGIC;
      M00_AXI_WSTRB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      M00_AXI_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      M00_AXI_WVALID : OUT STD_LOGIC;
      clk : OUT STD_LOGIC;
      fifo_rd_size : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      fifo_rdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      fifo_wr_size : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      irq : OUT STD_LOGIC;
      reset : OUT STD_LOGIC;
      s00_axi_arready : OUT STD_LOGIC;
      s00_axi_awready : OUT STD_LOGIC;
      s00_axi_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_buser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_bvalid : OUT STD_LOGIC;
      s00_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axi_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_rlast : OUT STD_LOGIC;
      s00_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s00_axi_ruser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s00_axi_rvalid : OUT STD_LOGIC;
      s00_axi_wready : OUT STD_LOGIC;
      sbus_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      sbus_be : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      sbus_rd : OUT STD_LOGIC;
      sbus_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      sbus_we : OUT STD_LOGIC;
      sync_o : OUT STD_LOGIC_VECTOR(99 DOWNTO 0);
      xfer_done : OUT STD_LOGIC
    );
  END COMPONENT top_axi_mst_sbus_bridge;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ACLK: SIGNAL IS "xilinx.com:signal:clock:1.0 M00_AXI_ACLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARESETN: SIGNAL IS "xilinx.com:signal:reset:1.0 M00_AXI_ARESETN RST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_BUSER: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RUSER: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_rd: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_rd";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_rd_enable: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_rd_enable";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_wdata: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_we: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_we";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_wr_enable: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_wr_enable";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_aruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wuser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_ack: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_ack";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_rdata: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARUSER: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWUSER: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_WUSER: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXI_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M00_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_rd_size: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_rd_size";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_rdata: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_wr_size: SIGNAL IS "fh-joanneum.local:user:dma_channel:1.0 dma_channel_mst dma_wr_size";
  ATTRIBUTE X_INTERFACE_INFO OF irq: SIGNAL IS "xilinx.com:signal:interrupt:1.0 irq INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF reset: SIGNAL IS "xilinx.com:signal:reset:1.0 reset RST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_buser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_ruser: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_addr: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_addr";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_be: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_be";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_rd: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_rd";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_wdata: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_we: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_we";
BEGIN
  U0 : top_axi_mst_sbus_bridge
    GENERIC MAP (
      C_M00_AXI_ADDR_WIDTH => 64,
      C_M00_AXI_ARUSER_WIDTH => 0,
      C_M00_AXI_AWUSER_WIDTH => 0,
      C_M00_AXI_BURST_LEN => 16,
      C_M00_AXI_BUSER_WIDTH => 0,
      C_M00_AXI_DATA_WIDTH => 64,
      C_M00_AXI_ID_WIDTH => 1,
      C_M00_AXI_RUSER_WIDTH => 0,
      C_M00_AXI_TARGET_SLAVE_BASE_ADDR => X"40000000",
      C_M00_AXI_WUSER_WIDTH => 0,
      C_S00_AXI_ADDR_WIDTH => 18,
      C_S00_AXI_ARUSER_WIDTH => 0,
      C_S00_AXI_AWUSER_WIDTH => 0,
      C_S00_AXI_BUSER_WIDTH => 0,
      C_S00_AXI_DATA_WIDTH => 32,
      C_S00_AXI_ID_WIDTH => 1,
      C_S00_AXI_RUSER_WIDTH => 0,
      C_S00_AXI_WUSER_WIDTH => 0,
      C_SLV_ADDR_WIDTH => 16,
      C_SLV_DATA_WIDTH => 32,
      C_SLOT_NUM => 30,
      C_SYNC_WIDTH => 100,
      C_CORE_CLK_FREQ => 100000000
    )
    PORT MAP (
      M00_AXI_ACLK => M00_AXI_ACLK,
      M00_AXI_ARESETN => M00_AXI_ARESETN,
      M00_AXI_ARREADY => M00_AXI_ARREADY,
      M00_AXI_AWREADY => M00_AXI_AWREADY,
      M00_AXI_BID => M00_AXI_BID,
      M00_AXI_BRESP => M00_AXI_BRESP,
      M00_AXI_BUSER => M00_AXI_BUSER,
      M00_AXI_BVALID => M00_AXI_BVALID,
      M00_AXI_RDATA => M00_AXI_RDATA,
      M00_AXI_RID => M00_AXI_RID,
      M00_AXI_RLAST => M00_AXI_RLAST,
      M00_AXI_RRESP => M00_AXI_RRESP,
      M00_AXI_RUSER => M00_AXI_RUSER,
      M00_AXI_RVALID => M00_AXI_RVALID,
      M00_AXI_WREADY => M00_AXI_WREADY,
      fifo_rd => fifo_rd,
      fifo_rd_enable => fifo_rd_enable,
      fifo_wdata => fifo_wdata,
      fifo_we => fifo_we,
      fifo_wr_enable => fifo_wr_enable,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr => s00_axi_araddr,
      s00_axi_arburst => s00_axi_arburst,
      s00_axi_arcache => s00_axi_arcache,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arid => s00_axi_arid,
      s00_axi_arlen => s00_axi_arlen,
      s00_axi_arlock => s00_axi_arlock,
      s00_axi_arprot => s00_axi_arprot,
      s00_axi_arqos => s00_axi_arqos,
      s00_axi_arregion => s00_axi_arregion,
      s00_axi_arsize => s00_axi_arsize,
      s00_axi_aruser => s00_axi_aruser,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr => s00_axi_awaddr,
      s00_axi_awburst => s00_axi_awburst,
      s00_axi_awcache => s00_axi_awcache,
      s00_axi_awid => s00_axi_awid,
      s00_axi_awlen => s00_axi_awlen,
      s00_axi_awlock => s00_axi_awlock,
      s00_axi_awprot => s00_axi_awprot,
      s00_axi_awqos => s00_axi_awqos,
      s00_axi_awregion => s00_axi_awregion,
      s00_axi_awsize => s00_axi_awsize,
      s00_axi_awuser => s00_axi_awuser,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata => s00_axi_wdata,
      s00_axi_wlast => s00_axi_wlast,
      s00_axi_wstrb => s00_axi_wstrb,
      s00_axi_wuser => s00_axi_wuser,
      s00_axi_wvalid => s00_axi_wvalid,
      sbus_ack => sbus_ack,
      sbus_rdata => sbus_rdata,
      sync_i => sync_i,
      xfer_sync_ext => xfer_sync_ext,
      M00_AXI_ARADDR => M00_AXI_ARADDR,
      M00_AXI_ARBURST => M00_AXI_ARBURST,
      M00_AXI_ARCACHE => M00_AXI_ARCACHE,
      M00_AXI_ARID => M00_AXI_ARID,
      M00_AXI_ARLEN => M00_AXI_ARLEN,
      M00_AXI_ARLOCK => M00_AXI_ARLOCK,
      M00_AXI_ARPROT => M00_AXI_ARPROT,
      M00_AXI_ARQOS => M00_AXI_ARQOS,
      M00_AXI_ARSIZE => M00_AXI_ARSIZE,
      M00_AXI_ARUSER => M00_AXI_ARUSER,
      M00_AXI_ARVALID => M00_AXI_ARVALID,
      M00_AXI_AWADDR => M00_AXI_AWADDR,
      M00_AXI_AWBURST => M00_AXI_AWBURST,
      M00_AXI_AWCACHE => M00_AXI_AWCACHE,
      M00_AXI_AWID => M00_AXI_AWID,
      M00_AXI_AWLEN => M00_AXI_AWLEN,
      M00_AXI_AWLOCK => M00_AXI_AWLOCK,
      M00_AXI_AWPROT => M00_AXI_AWPROT,
      M00_AXI_AWQOS => M00_AXI_AWQOS,
      M00_AXI_AWSIZE => M00_AXI_AWSIZE,
      M00_AXI_AWUSER => M00_AXI_AWUSER,
      M00_AXI_AWVALID => M00_AXI_AWVALID,
      M00_AXI_BREADY => M00_AXI_BREADY,
      M00_AXI_RREADY => M00_AXI_RREADY,
      M00_AXI_WDATA => M00_AXI_WDATA,
      M00_AXI_WLAST => M00_AXI_WLAST,
      M00_AXI_WSTRB => M00_AXI_WSTRB,
      M00_AXI_WUSER => M00_AXI_WUSER,
      M00_AXI_WVALID => M00_AXI_WVALID,
      clk => clk,
      fifo_rd_size => fifo_rd_size,
      fifo_rdata => fifo_rdata,
      fifo_wr_size => fifo_wr_size,
      irq => irq,
      reset => reset,
      s00_axi_arready => s00_axi_arready,
      s00_axi_awready => s00_axi_awready,
      s00_axi_bid => s00_axi_bid,
      s00_axi_bresp => s00_axi_bresp,
      s00_axi_buser => s00_axi_buser,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata => s00_axi_rdata,
      s00_axi_rid => s00_axi_rid,
      s00_axi_rlast => s00_axi_rlast,
      s00_axi_rresp => s00_axi_rresp,
      s00_axi_ruser => s00_axi_ruser,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wready => s00_axi_wready,
      sbus_addr => sbus_addr,
      sbus_be => sbus_be,
      sbus_rd => sbus_rd,
      sbus_wdata => sbus_wdata,
      sbus_we => sbus_we,
      sync_o => sync_o,
      xfer_done => xfer_done
    );
END system_axi_mst_sbus_bridge_0_0_arch;

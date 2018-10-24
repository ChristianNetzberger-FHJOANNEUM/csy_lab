-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
-- Date        : Tue Oct 23 20:00:59 2018
-- Host        : KPERSM7467 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/ECM_DCD/username/apps/project_csy/project_csy.srcs/sources_1/bd/system/ip/system_axi_mst_sbus_bridge_0_0/system_axi_mst_sbus_bridge_0_0_stub.vhdl
-- Design      : system_axi_mst_sbus_bridge_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_axi_mst_sbus_bridge_0_0 is
  Port ( 
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

end system_axi_mst_sbus_bridge_0_0;

architecture stub of system_axi_mst_sbus_bridge_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "M00_AXI_ACLK,M00_AXI_ARESETN,M00_AXI_ARREADY,M00_AXI_AWREADY,M00_AXI_BID[0:0],M00_AXI_BRESP[1:0],M00_AXI_BUSER[0:0],M00_AXI_BVALID,M00_AXI_RDATA[63:0],M00_AXI_RID[0:0],M00_AXI_RLAST,M00_AXI_RRESP[1:0],M00_AXI_RUSER[0:0],M00_AXI_RVALID,M00_AXI_WREADY,fifo_rd,fifo_rd_enable,fifo_wdata[63:0],fifo_we,fifo_wr_enable,s00_axi_aclk,s00_axi_araddr[17:0],s00_axi_arburst[1:0],s00_axi_arcache[3:0],s00_axi_aresetn,s00_axi_arid[0:0],s00_axi_arlen[7:0],s00_axi_arlock,s00_axi_arprot[2:0],s00_axi_arqos[3:0],s00_axi_arregion[3:0],s00_axi_arsize[2:0],s00_axi_aruser[0:0],s00_axi_arvalid,s00_axi_awaddr[17:0],s00_axi_awburst[1:0],s00_axi_awcache[3:0],s00_axi_awid[0:0],s00_axi_awlen[7:0],s00_axi_awlock,s00_axi_awprot[2:0],s00_axi_awqos[3:0],s00_axi_awregion[3:0],s00_axi_awsize[2:0],s00_axi_awuser[0:0],s00_axi_awvalid,s00_axi_bready,s00_axi_rready,s00_axi_wdata[31:0],s00_axi_wlast,s00_axi_wstrb[3:0],s00_axi_wuser[0:0],s00_axi_wvalid,sbus_ack,sbus_rdata[31:0],sync_i[99:0],xfer_sync_ext,M00_AXI_ARADDR[63:0],M00_AXI_ARBURST[1:0],M00_AXI_ARCACHE[3:0],M00_AXI_ARID[0:0],M00_AXI_ARLEN[7:0],M00_AXI_ARLOCK,M00_AXI_ARPROT[2:0],M00_AXI_ARQOS[3:0],M00_AXI_ARSIZE[2:0],M00_AXI_ARUSER[0:0],M00_AXI_ARVALID,M00_AXI_AWADDR[63:0],M00_AXI_AWBURST[1:0],M00_AXI_AWCACHE[3:0],M00_AXI_AWID[0:0],M00_AXI_AWLEN[7:0],M00_AXI_AWLOCK,M00_AXI_AWPROT[2:0],M00_AXI_AWQOS[3:0],M00_AXI_AWSIZE[2:0],M00_AXI_AWUSER[0:0],M00_AXI_AWVALID,M00_AXI_BREADY,M00_AXI_RREADY,M00_AXI_WDATA[63:0],M00_AXI_WLAST,M00_AXI_WSTRB[7:0],M00_AXI_WUSER[0:0],M00_AXI_WVALID,clk,fifo_rd_size[15:0],fifo_rdata[63:0],fifo_wr_size[15:0],irq,reset,s00_axi_arready,s00_axi_awready,s00_axi_bid[0:0],s00_axi_bresp[1:0],s00_axi_buser[0:0],s00_axi_bvalid,s00_axi_rdata[31:0],s00_axi_rid[0:0],s00_axi_rlast,s00_axi_rresp[1:0],s00_axi_ruser[0:0],s00_axi_rvalid,s00_axi_wready,sbus_addr[15:0],sbus_be[3:0],sbus_rd,sbus_wdata[31:0],sbus_we,sync_o[99:0],xfer_done";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "top_axi_mst_sbus_bridge,Vivado 2017.2";
begin
end;

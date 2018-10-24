// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Tue Oct 23 20:00:59 2018
// Host        : KPERSM7467 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/ECM_DCD/username/apps/project_csy/project_csy.srcs/sources_1/bd/system/ip/system_axi_mst_sbus_bridge_0_0/system_axi_mst_sbus_bridge_0_0_stub.v
// Design      : system_axi_mst_sbus_bridge_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "top_axi_mst_sbus_bridge,Vivado 2017.2" *)
module system_axi_mst_sbus_bridge_0_0(M00_AXI_ACLK, M00_AXI_ARESETN, 
  M00_AXI_ARREADY, M00_AXI_AWREADY, M00_AXI_BID, M00_AXI_BRESP, M00_AXI_BUSER, 
  M00_AXI_BVALID, M00_AXI_RDATA, M00_AXI_RID, M00_AXI_RLAST, M00_AXI_RRESP, M00_AXI_RUSER, 
  M00_AXI_RVALID, M00_AXI_WREADY, fifo_rd, fifo_rd_enable, fifo_wdata, fifo_we, fifo_wr_enable, 
  s00_axi_aclk, s00_axi_araddr, s00_axi_arburst, s00_axi_arcache, s00_axi_aresetn, 
  s00_axi_arid, s00_axi_arlen, s00_axi_arlock, s00_axi_arprot, s00_axi_arqos, 
  s00_axi_arregion, s00_axi_arsize, s00_axi_aruser, s00_axi_arvalid, s00_axi_awaddr, 
  s00_axi_awburst, s00_axi_awcache, s00_axi_awid, s00_axi_awlen, s00_axi_awlock, 
  s00_axi_awprot, s00_axi_awqos, s00_axi_awregion, s00_axi_awsize, s00_axi_awuser, 
  s00_axi_awvalid, s00_axi_bready, s00_axi_rready, s00_axi_wdata, s00_axi_wlast, 
  s00_axi_wstrb, s00_axi_wuser, s00_axi_wvalid, sbus_ack, sbus_rdata, sync_i, xfer_sync_ext, 
  M00_AXI_ARADDR, M00_AXI_ARBURST, M00_AXI_ARCACHE, M00_AXI_ARID, M00_AXI_ARLEN, 
  M00_AXI_ARLOCK, M00_AXI_ARPROT, M00_AXI_ARQOS, M00_AXI_ARSIZE, M00_AXI_ARUSER, 
  M00_AXI_ARVALID, M00_AXI_AWADDR, M00_AXI_AWBURST, M00_AXI_AWCACHE, M00_AXI_AWID, 
  M00_AXI_AWLEN, M00_AXI_AWLOCK, M00_AXI_AWPROT, M00_AXI_AWQOS, M00_AXI_AWSIZE, 
  M00_AXI_AWUSER, M00_AXI_AWVALID, M00_AXI_BREADY, M00_AXI_RREADY, M00_AXI_WDATA, 
  M00_AXI_WLAST, M00_AXI_WSTRB, M00_AXI_WUSER, M00_AXI_WVALID, clk, fifo_rd_size, fifo_rdata, 
  fifo_wr_size, irq, reset, s00_axi_arready, s00_axi_awready, s00_axi_bid, s00_axi_bresp, 
  s00_axi_buser, s00_axi_bvalid, s00_axi_rdata, s00_axi_rid, s00_axi_rlast, s00_axi_rresp, 
  s00_axi_ruser, s00_axi_rvalid, s00_axi_wready, sbus_addr, sbus_be, sbus_rd, sbus_wdata, 
  sbus_we, sync_o, xfer_done)
/* synthesis syn_black_box black_box_pad_pin="M00_AXI_ACLK,M00_AXI_ARESETN,M00_AXI_ARREADY,M00_AXI_AWREADY,M00_AXI_BID[0:0],M00_AXI_BRESP[1:0],M00_AXI_BUSER[0:0],M00_AXI_BVALID,M00_AXI_RDATA[63:0],M00_AXI_RID[0:0],M00_AXI_RLAST,M00_AXI_RRESP[1:0],M00_AXI_RUSER[0:0],M00_AXI_RVALID,M00_AXI_WREADY,fifo_rd,fifo_rd_enable,fifo_wdata[63:0],fifo_we,fifo_wr_enable,s00_axi_aclk,s00_axi_araddr[17:0],s00_axi_arburst[1:0],s00_axi_arcache[3:0],s00_axi_aresetn,s00_axi_arid[0:0],s00_axi_arlen[7:0],s00_axi_arlock,s00_axi_arprot[2:0],s00_axi_arqos[3:0],s00_axi_arregion[3:0],s00_axi_arsize[2:0],s00_axi_aruser[0:0],s00_axi_arvalid,s00_axi_awaddr[17:0],s00_axi_awburst[1:0],s00_axi_awcache[3:0],s00_axi_awid[0:0],s00_axi_awlen[7:0],s00_axi_awlock,s00_axi_awprot[2:0],s00_axi_awqos[3:0],s00_axi_awregion[3:0],s00_axi_awsize[2:0],s00_axi_awuser[0:0],s00_axi_awvalid,s00_axi_bready,s00_axi_rready,s00_axi_wdata[31:0],s00_axi_wlast,s00_axi_wstrb[3:0],s00_axi_wuser[0:0],s00_axi_wvalid,sbus_ack,sbus_rdata[31:0],sync_i[99:0],xfer_sync_ext,M00_AXI_ARADDR[63:0],M00_AXI_ARBURST[1:0],M00_AXI_ARCACHE[3:0],M00_AXI_ARID[0:0],M00_AXI_ARLEN[7:0],M00_AXI_ARLOCK,M00_AXI_ARPROT[2:0],M00_AXI_ARQOS[3:0],M00_AXI_ARSIZE[2:0],M00_AXI_ARUSER[0:0],M00_AXI_ARVALID,M00_AXI_AWADDR[63:0],M00_AXI_AWBURST[1:0],M00_AXI_AWCACHE[3:0],M00_AXI_AWID[0:0],M00_AXI_AWLEN[7:0],M00_AXI_AWLOCK,M00_AXI_AWPROT[2:0],M00_AXI_AWQOS[3:0],M00_AXI_AWSIZE[2:0],M00_AXI_AWUSER[0:0],M00_AXI_AWVALID,M00_AXI_BREADY,M00_AXI_RREADY,M00_AXI_WDATA[63:0],M00_AXI_WLAST,M00_AXI_WSTRB[7:0],M00_AXI_WUSER[0:0],M00_AXI_WVALID,clk,fifo_rd_size[15:0],fifo_rdata[63:0],fifo_wr_size[15:0],irq,reset,s00_axi_arready,s00_axi_awready,s00_axi_bid[0:0],s00_axi_bresp[1:0],s00_axi_buser[0:0],s00_axi_bvalid,s00_axi_rdata[31:0],s00_axi_rid[0:0],s00_axi_rlast,s00_axi_rresp[1:0],s00_axi_ruser[0:0],s00_axi_rvalid,s00_axi_wready,sbus_addr[15:0],sbus_be[3:0],sbus_rd,sbus_wdata[31:0],sbus_we,sync_o[99:0],xfer_done" */;
  input M00_AXI_ACLK;
  input M00_AXI_ARESETN;
  input M00_AXI_ARREADY;
  input M00_AXI_AWREADY;
  input [0:0]M00_AXI_BID;
  input [1:0]M00_AXI_BRESP;
  input [0:0]M00_AXI_BUSER;
  input M00_AXI_BVALID;
  input [63:0]M00_AXI_RDATA;
  input [0:0]M00_AXI_RID;
  input M00_AXI_RLAST;
  input [1:0]M00_AXI_RRESP;
  input [0:0]M00_AXI_RUSER;
  input M00_AXI_RVALID;
  input M00_AXI_WREADY;
  input fifo_rd;
  input fifo_rd_enable;
  input [63:0]fifo_wdata;
  input fifo_we;
  input fifo_wr_enable;
  input s00_axi_aclk;
  input [17:0]s00_axi_araddr;
  input [1:0]s00_axi_arburst;
  input [3:0]s00_axi_arcache;
  input s00_axi_aresetn;
  input [0:0]s00_axi_arid;
  input [7:0]s00_axi_arlen;
  input s00_axi_arlock;
  input [2:0]s00_axi_arprot;
  input [3:0]s00_axi_arqos;
  input [3:0]s00_axi_arregion;
  input [2:0]s00_axi_arsize;
  input [0:0]s00_axi_aruser;
  input s00_axi_arvalid;
  input [17:0]s00_axi_awaddr;
  input [1:0]s00_axi_awburst;
  input [3:0]s00_axi_awcache;
  input [0:0]s00_axi_awid;
  input [7:0]s00_axi_awlen;
  input s00_axi_awlock;
  input [2:0]s00_axi_awprot;
  input [3:0]s00_axi_awqos;
  input [3:0]s00_axi_awregion;
  input [2:0]s00_axi_awsize;
  input [0:0]s00_axi_awuser;
  input s00_axi_awvalid;
  input s00_axi_bready;
  input s00_axi_rready;
  input [31:0]s00_axi_wdata;
  input s00_axi_wlast;
  input [3:0]s00_axi_wstrb;
  input [0:0]s00_axi_wuser;
  input s00_axi_wvalid;
  input sbus_ack;
  input [31:0]sbus_rdata;
  input [99:0]sync_i;
  input xfer_sync_ext;
  output [63:0]M00_AXI_ARADDR;
  output [1:0]M00_AXI_ARBURST;
  output [3:0]M00_AXI_ARCACHE;
  output [0:0]M00_AXI_ARID;
  output [7:0]M00_AXI_ARLEN;
  output M00_AXI_ARLOCK;
  output [2:0]M00_AXI_ARPROT;
  output [3:0]M00_AXI_ARQOS;
  output [2:0]M00_AXI_ARSIZE;
  output [0:0]M00_AXI_ARUSER;
  output M00_AXI_ARVALID;
  output [63:0]M00_AXI_AWADDR;
  output [1:0]M00_AXI_AWBURST;
  output [3:0]M00_AXI_AWCACHE;
  output [0:0]M00_AXI_AWID;
  output [7:0]M00_AXI_AWLEN;
  output M00_AXI_AWLOCK;
  output [2:0]M00_AXI_AWPROT;
  output [3:0]M00_AXI_AWQOS;
  output [2:0]M00_AXI_AWSIZE;
  output [0:0]M00_AXI_AWUSER;
  output M00_AXI_AWVALID;
  output M00_AXI_BREADY;
  output M00_AXI_RREADY;
  output [63:0]M00_AXI_WDATA;
  output M00_AXI_WLAST;
  output [7:0]M00_AXI_WSTRB;
  output [0:0]M00_AXI_WUSER;
  output M00_AXI_WVALID;
  output clk;
  output [15:0]fifo_rd_size;
  output [63:0]fifo_rdata;
  output [15:0]fifo_wr_size;
  output irq;
  output reset;
  output s00_axi_arready;
  output s00_axi_awready;
  output [0:0]s00_axi_bid;
  output [1:0]s00_axi_bresp;
  output [0:0]s00_axi_buser;
  output s00_axi_bvalid;
  output [31:0]s00_axi_rdata;
  output [0:0]s00_axi_rid;
  output s00_axi_rlast;
  output [1:0]s00_axi_rresp;
  output [0:0]s00_axi_ruser;
  output s00_axi_rvalid;
  output s00_axi_wready;
  output [15:0]sbus_addr;
  output [3:0]sbus_be;
  output sbus_rd;
  output [31:0]sbus_wdata;
  output sbus_we;
  output [99:0]sync_o;
  output xfer_done;
endmodule

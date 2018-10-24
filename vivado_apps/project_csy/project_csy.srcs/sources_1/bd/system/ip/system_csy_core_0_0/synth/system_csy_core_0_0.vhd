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

-- IP VLNV: fh-joanneum.local:user:csy_core:1.0
-- IP Revision: 4

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY csy_lib;
USE csy_lib.top_csy_core;

ENTITY system_csy_core_0_0 IS
  PORT (
    buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    recdat : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    sbus_ack_mst : IN STD_LOGIC;
    sbus_addr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    sbus_be : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    sbus_rd : IN STD_LOGIC;
    sbus_rdata_mst : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sbus_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sbus_we : IN STD_LOGIC;
    serial_rxd : IN STD_LOGIC;
    sliders : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    bclk : OUT STD_LOGIC;
    gpo : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    irq_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    leds : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    mclk : OUT STD_LOGIC;
    mute : OUT STD_LOGIC;
    pbdat : OUT STD_LOGIC;
    pblrc : OUT STD_LOGIC;
    reclrc : OUT STD_LOGIC;
    sbus_ack : OUT STD_LOGIC;
    sbus_addr_mst : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    sbus_be_mst : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    sbus_rd_mst : OUT STD_LOGIC;
    sbus_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sbus_wdata_mst : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sbus_we_mst : OUT STD_LOGIC;
    scl : OUT STD_LOGIC;
    serial_en : OUT STD_LOGIC;
    serial_txd : OUT STD_LOGIC;
    sda : INOUT STD_LOGIC
  );
END system_csy_core_0_0;

ARCHITECTURE system_csy_core_0_0_arch OF system_csy_core_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_csy_core_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT top_csy_core IS
    GENERIC (
      C_CORE_CLK_FREQUENCY : INTEGER;
      C_NUM_INTR : INTEGER;
      C_NUM_GPO : INTEGER;
      C_SLV_ADDR_BASE : STD_LOGIC_VECTOR;
      C_SLV_ADDR_RANGE : STD_LOGIC_VECTOR;
      C_SYNTHESIS_OPTION : INTEGER;
      simulation_g : BOOLEAN
    );
    PORT (
      buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      clk : IN STD_LOGIC;
      recdat : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      sbus_ack_mst : IN STD_LOGIC;
      sbus_addr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      sbus_be : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      sbus_rd : IN STD_LOGIC;
      sbus_rdata_mst : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sbus_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sbus_we : IN STD_LOGIC;
      serial_rxd : IN STD_LOGIC;
      sliders : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      bclk : OUT STD_LOGIC;
      gpo : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      irq_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      leds : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      mclk : OUT STD_LOGIC;
      mute : OUT STD_LOGIC;
      pbdat : OUT STD_LOGIC;
      pblrc : OUT STD_LOGIC;
      reclrc : OUT STD_LOGIC;
      sbus_ack : OUT STD_LOGIC;
      sbus_addr_mst : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      sbus_be_mst : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      sbus_rd_mst : OUT STD_LOGIC;
      sbus_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      sbus_wdata_mst : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      sbus_we_mst : OUT STD_LOGIC;
      scl : OUT STD_LOGIC;
      serial_en : OUT STD_LOGIC;
      serial_txd : OUT STD_LOGIC;
      sda : INOUT STD_LOGIC
    );
  END COMPONENT top_csy_core;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_csy_core_0_0_arch: ARCHITECTURE IS "top_csy_core,Vivado 2017.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_csy_core_0_0_arch : ARCHITECTURE IS "system_csy_core_0_0,top_csy_core,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF recdat: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s recdat";
  ATTRIBUTE X_INTERFACE_INFO OF reset: SIGNAL IS "xilinx.com:signal:reset:1.0 reset RST";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_ack_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_ack";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_addr: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_addr";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_be: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_be";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_rd: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_rd";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_rdata_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_wdata: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_we: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_we";
  ATTRIBUTE X_INTERFACE_INFO OF bclk: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s bclk";
  ATTRIBUTE X_INTERFACE_INFO OF irq_o: SIGNAL IS "xilinx.com:signal:interrupt:1.0 irq_o INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF mclk: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s mclk";
  ATTRIBUTE X_INTERFACE_INFO OF mute: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s mute";
  ATTRIBUTE X_INTERFACE_INFO OF pbdat: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s pbdat";
  ATTRIBUTE X_INTERFACE_INFO OF pblrc: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s pblrc";
  ATTRIBUTE X_INTERFACE_INFO OF reclrc: SIGNAL IS "fh-joanneum.local:user:i2s:1.0 codec_i2s reclrc";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_ack: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_ack";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_addr_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_addr";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_be_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_be";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_rd_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_rd";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_rdata: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_slv sbus_rdata";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_wdata_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_wdata";
  ATTRIBUTE X_INTERFACE_INFO OF sbus_we_mst: SIGNAL IS "fh-joanneum.local:user:sbus:1.0 sbus_mst sbus_we";
  ATTRIBUTE X_INTERFACE_INFO OF scl: SIGNAL IS "fh-joanneum.local:user:i2c:1.0 codec_i2c scl";
  ATTRIBUTE X_INTERFACE_INFO OF sda: SIGNAL IS "fh-joanneum.local:user:i2c:1.0 codec_i2c sda";
BEGIN
  U0 : top_csy_core
    GENERIC MAP (
      C_CORE_CLK_FREQUENCY => 108000000,
      C_NUM_INTR => 2,
      C_NUM_GPO => 2,
      C_SLV_ADDR_BASE => X"0000",
      C_SLV_ADDR_RANGE => X"0010",
      C_SYNTHESIS_OPTION => 1,
      simulation_g => false
    )
    PORT MAP (
      buttons => buttons,
      clk => clk,
      recdat => recdat,
      reset => reset,
      sbus_ack_mst => sbus_ack_mst,
      sbus_addr => sbus_addr,
      sbus_be => sbus_be,
      sbus_rd => sbus_rd,
      sbus_rdata_mst => sbus_rdata_mst,
      sbus_wdata => sbus_wdata,
      sbus_we => sbus_we,
      serial_rxd => serial_rxd,
      sliders => sliders,
      bclk => bclk,
      gpo => gpo,
      irq_o => irq_o,
      leds => leds,
      mclk => mclk,
      mute => mute,
      pbdat => pbdat,
      pblrc => pblrc,
      reclrc => reclrc,
      sbus_ack => sbus_ack,
      sbus_addr_mst => sbus_addr_mst,
      sbus_be_mst => sbus_be_mst,
      sbus_rd_mst => sbus_rd_mst,
      sbus_rdata => sbus_rdata,
      sbus_wdata_mst => sbus_wdata_mst,
      sbus_we_mst => sbus_we_mst,
      scl => scl,
      serial_en => serial_en,
      serial_txd => serial_txd,
      sda => sda
    );
END system_csy_core_0_0_arch;

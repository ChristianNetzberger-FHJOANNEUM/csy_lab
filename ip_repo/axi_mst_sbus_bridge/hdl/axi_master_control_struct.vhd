-- VHDL Entity axi_mst_sbus_bridge.axi_master_control.symbol
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 21:25:33 24.04.2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2016.2 (Build 5)
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
library work;
use work.busdef.ALL;

entity axi_master_control is
   generic( 
      C_SLV_ADDR_WIDTH   : integer := 16;
      C_SLV_DATA_WIDTH   : integer := 32;
      C_CORE_CLOCK_FREQ  : integer := 100000000;
      hw_serial_number_g : integer := 12;
      hw_version_g       : integer := 123;
      C_SYNC_WIDTH       : integer := 16
   );
   port( 
      -- Asserts when transaction is complete
      RXN_DONE                  : in     std_logic;
      -- Asserts when transaction is complete
      TXN_DONE                  : in     std_logic;
      clk                       : in     std_logic;
      fifo_rd                   : in     std_logic;
      fifo_rd_enable            : in     std_logic;
      fifo_wdata                : in     std_logic_vector (63 downto 0);
      fifo_we                   : in     std_logic;
      fifo_wr_enable            : in     std_logic;
      rd_data                   : in     std_logic_vector (63  downto 0);
      rd_next                   : in     std_logic;
      reset                     : in     std_logic;
      sbus_i                    : in     sbus_i_t;
      sync_i                    : in     std_logic_vector (C_SYNC_WIDTH-1 downto 0);
      we_next                   : in     std_logic;
      xfer_sync_ext             : in     std_logic;
      -- Users to add ports here
      
      -- User ports ends
      -- Do not modify the ports beyond this line
      
      -- Initiate AXI transactions
      INIT_AXI_RX               : out    std_logic;
      -- Users to add ports here
      
      -- User ports ends
      -- Do not modify the ports beyond this line
      
      -- Initiate AXI transactions
      INIT_AXI_TX               : out    std_logic;
      arcache                   : out    std_logic_vector (3 downto 0);
      awcache                   : out    std_logic_vector (3 downto 0);
      fifo_rd_size              : out    std_logic_vector (15 downto 0);
      fifo_rdata                : out    std_logic_vector (63 downto 0);
      fifo_wr_size              : out    std_logic_vector (15 downto 0);
      irq                       : out    std_logic;
      no_of_bursts_req          : out    std_logic_vector (7 downto 0);
      sbus_o                    : out    sbus_o_t;
      sync_o                    : out    std_logic_vector (C_SYNC_WIDTH-1 downto 0);
      target_slave_base_address : out    std_logic_vector (31 downto 0);
      we_data                   : out    std_logic_vector (63  downto 0);
      xfer_done                 : out    std_logic
   );

-- Declarations

end axi_master_control ;

--
-- VHDL Architecture axi_mst_sbus_bridge.axi_master_control.struct
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 15:18:21 08.08.2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2016.2 (Build 5)
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.all;
library work;
use work.busdef.all;

library axi_mst_sbus_bridge;

architecture struct of axi_master_control is

   -- Architecture declarations

   -- Internal signal declarations
   signal button               : std_logic_vector(3 downto 0);
   signal dip                  : std_logic_vector(7 downto 0);
   signal encoder              : std_logic_vector(1 downto 0);
   signal fifo_threshold       : std_logic_vector(15 downto 0);
   signal fifo_wr_flush        : std_logic;
   signal hi                   : std_logic;
   signal irq_clear            : std_logic;
   signal irq_delay_cnt        : std_logic_vector(7 downto 0);
   signal irq_delayed          : std_logic;
   signal irq_err_cnt          : std_logic_vector(31 downto 0);
   signal irq_err_cnt_clear    : std_logic;
   signal irq_flag             : std_logic;
   signal irq_mask             : std_logic;
   signal lo                   : std_logic;
   signal millisec_tc          : std_logic;
   signal reg00                : std_logic_vector(31 downto 0);
   signal reg00_in             : std_logic_vector(31 downto 0);
   signal reg01                : std_logic_vector(31 downto 0);
   signal reg01_in             : std_logic_vector(31 downto 0);
   signal reg02                : std_logic_vector(31 downto 0);
   signal reg02_in             : std_logic_vector(31 downto 0);
   signal reg03                : std_logic_vector(31 downto 0);
   signal reg03_in             : std_logic_vector(31 downto 0);
   signal reg04                : std_logic_vector(31 downto 0);
   signal reg05                : std_logic_vector(31 downto 0);
   signal reg06                : std_logic_vector(31 downto 0);
   signal reg07                : std_logic_vector(31 downto 0);
   signal reg07_in             : std_logic_vector(31 downto 0);
   signal reg08                : std_logic_vector(31 downto 0);
   signal reg08_in             : std_logic_vector(31 downto 0);
   signal reg09                : std_logic_vector(31 downto 0);
   signal reg09_in             : std_logic_vector(31 downto 0);
   signal reg0A                : std_logic_vector(31 downto 0);
   signal reg0A_in             : std_logic_vector(31 downto 0);
   signal reg0B                : std_logic_vector(31 downto 0);
   signal reg0B_in             : std_logic_vector(31 downto 0);
   signal reg0C                : std_logic_vector(31 downto 0);
   signal reg0C_in             : std_logic_vector(31 downto 0);
   signal reg0D                : std_logic_vector(31 downto 0);
   signal reg0D_in             : std_logic_vector(31 downto 0);
   signal reg0E                : std_logic_vector(31 downto 0);
   signal reg0E_in             : std_logic_vector(31 downto 0);
   signal reg0F                : std_logic_vector(31 downto 0);
   signal reg0F_in             : std_logic_vector(31 downto 0);
   signal reg10                : std_logic_vector(31 downto 0);
   signal reg11                : std_logic_vector(31 downto 0);
   signal reg12                : std_logic_vector(31 downto 0);
   signal reg13                : std_logic_vector(31 downto 0);
   signal reg14                : std_logic_vector(31 downto 0);
   signal reg15                : std_logic_vector(31 downto 0);
   signal reg16                : std_logic_vector(31 downto 0);
   signal reg17                : std_logic_vector(31 downto 0);
   signal reg_din              : std_logic_vector( 16*32-1 downto 0 );    -- parallel input for readback
   signal reg_dout             : std_logic_vector( 16*32-1 downto 0 );    -- parallel output of all registers
   signal reg_we               : std_logic_vector( 15 downto 0);          -- active high write strobes
   signal resetval             : std_logic_vector( 16*32-1 downto 0 );
   signal sig0                 : std_logic;
   signal threshold            : std_logic_vector(15 downto 0);
   signal timer0               : std_logic;
   signal timer0_cnt_enable    : std_logic;
   signal timer0_cycle_modulus : std_logic_vector(31 downto 0);
   signal timer1               : std_logic;
   signal timer1_cnt_enable    : std_logic;
   signal timer1_cycle_modulus : std_logic_vector(31 downto 0);
   signal timestamp            : std_logic_vector(31 downto 0);
   signal xfer_cnt_enable      : std_logic;
   signal xfer_cycle_modulus   : std_logic_vector(31 downto 0);
   signal xfer_enable          : std_logic;
   signal xfer_fifo_rd_ptr     : std_logic_vector(31 downto 0);
   signal xfer_fifo_size       : std_logic_vector(31 downto 0);
   signal xfer_fifo_wr_ptr     : std_logic_vector(31 downto 0);
   signal xfer_init            : std_logic;
   signal xfer_loopback        : std_logic;
   signal xfer_mode            : std_logic;
   signal xfer_num_reset       : std_logic;
   signal xfer_rd_base_address : std_logic_vector(31 downto 0);
   signal xfer_rd_continuous   : std_logic;
   signal xfer_rd_en           : std_logic;
   signal xfer_rd_init         : std_logic;
   signal xfer_rd_reset        : std_logic;
   signal xfer_rd_snapshot     : std_logic;
   signal xfer_read            : std_logic;
   signal xfer_select          : std_logic_vector(1 downto 0);
   signal xfer_sync_autoread   : std_logic;
   signal xfer_sync_int        : std_logic;
   signal xfer_wr_base_address : std_logic_vector(31 downto 0);
   signal xfer_wr_continuous   : std_logic;
   signal xfer_wr_en           : std_logic;
   signal xfer_wr_init         : std_logic;
   signal xfer_wr_reset        : std_logic;
   signal xfer_wr_snapshot     : std_logic;
   signal xfer_write           : std_logic;

   -- Implicit buffer signal declarations
   signal fifo_rd_size_internal : std_logic_vector (15 downto 0);
   signal fifo_wr_size_internal : std_logic_vector (15 downto 0);
   signal xfer_done_internal    : std_logic;


attribute mark_debug : string;
--#pragma translate_off
attribute mark_debug of init_axi_tx: signal is "true";
attribute mark_debug of init_axi_rx: signal is "true";
attribute mark_debug of txn_done: signal is "true";
attribute mark_debug of rxn_done: signal is "true";
attribute mark_debug of we_data: signal is "true";
attribute mark_debug of we_next: signal is "true";
attribute mark_debug of rd_data: signal is "true";
attribute mark_debug of rd_next: signal is "true";
attribute mark_debug of  xfer_enable: signal is "true";
attribute mark_debug of  xfer_init: signal is "true";
attribute mark_debug of xfer_done: signal is "true";
attribute mark_debug of target_slave_base_address: signal is "true";
attribute mark_debug of xfer_rd_base_address: signal is "true";
--#pragma translate_on

   -- Component Declarations
   component axi_xfer_ctrl
   port (
      -- Asserts when transaction is complete
      RXN_DONE                  : in     std_logic ;
      -- Asserts when transaction is complete
      TXN_DONE                  : in     std_logic ;
      clk                       : in     std_logic ;
      fifo_rd_size              : in     std_logic_vector (31 downto 0);
      fifo_wr_size              : in     std_logic_vector (31 downto 0);
      loopback                  : in     std_logic ;
      rd_continuous             : in     std_logic ;
      rd_snapshot               : in     std_logic ;
      reset                     : in     std_logic ;
      wr_continuous             : in     std_logic ;
      wr_snapshot               : in     std_logic ;
      xfer_enable               : in     std_logic ;
      xfer_init                 : in     std_logic ;
      xfer_mode                 : in     std_logic ;
      xfer_num_reset            : in     std_logic ;
      xfer_rd                   : in     std_logic ;
      xfer_rd_base_address      : in     std_logic_vector (31 downto 0);
      xfer_rd_init              : in     std_logic ;
      xfer_rd_reset             : in     std_logic ;
      xfer_we                   : in     std_logic ;
      xfer_wr_base_address      : in     std_logic_vector (31 downto 0);
      xfer_wr_init              : in     std_logic ;
      xfer_wr_reset             : in     std_logic ;
      -- Users to add ports here
      
      -- User ports ends
      -- Do not modify the ports beyond this line
      
      -- Initiate AXI transactions
      INIT_AXI_RX               : out    std_logic ;
      -- Users to add ports here
      
      -- User ports ends
      -- Do not modify the ports beyond this line
      
      -- Initiate AXI transactions
      INIT_AXI_TX               : out    std_logic ;
      fifo_rd_ptr               : out    std_logic_vector (31 downto 0);
      fifo_wr_ptr               : out    std_logic_vector (31 downto 0);
      no_of_bursts_req          : out    std_logic_vector (7 downto 0);
      target_slave_base_address : out    std_logic_vector (31 downto 0);
      xfer_done                 : out    std_logic ;
      xfer_rd_num_o             : out    std_logic_vector (31 downto 0)
   );
   end component;
   component cnt_modulus
   generic (
      n_dout_g : integer := 8;
      module_g : integer := 256
   );
   port (
      clk    : in     std_logic ;
      enable : in     std_logic ;
      reset  : in     std_logic ;
      dout   : out    std_logic_vector (n_dout_g-1 downto 0);
      cnt_tc : out    std_logic 
   );
   end component;
   component cnt_modulus_c
   generic (
      width_g : integer := 8
   );
   port (
      clk     : in     std_logic ;
      reset   : in     std_logic ;
      enable  : in     std_logic ;
      modulus : in     std_logic_vector (width_g-1 downto 0);
      cnt_tc  : out    std_logic ;
      cnt     : out    std_logic_vector (width_g-1 downto 0)
   );
   end component;
   component fifo_distram
   generic (
      awidth_g : integer := 10;
      dwidth_g : integer := 32
   );
   port (
      clk       : in     std_logic ;
      reset     : in     std_logic ;
      we_ack    : out    std_logic ;
      wdata     : in     std_logic_vector (dwidth_g-1 downto 0);
      we        : in     std_logic ;
      rd_ack    : out    std_logic ;
      fifo_en   : in     std_logic ;
      fifo_size : out    std_logic_vector (15 downto 0);
      rdata     : out    std_logic_vector (dwidth_g-1 downto 0);
      rd        : in     std_logic 
   );
   end component;
   component fifo_stream_ctrl
   port (
      clk           : in     std_logic ;
      fifo_rd       : in     std_logic ;
      fifo_rd_en    : in     std_logic ;
      fifo_rd_size  : in     std_logic_vector (15 downto 0);
      fifo_wr_en    : in     std_logic ;
      fifo_wr_size  : in     std_logic_vector (15 downto 0);
      reset         : in     std_logic ;
      threshold     : in     std_logic_vector (15 downto 0);
      xfer_done     : in     std_logic ;
      xfer_rd_en    : in     std_logic ;
      xfer_wr_en    : in     std_logic ;
      fifo_wr_flush : out    std_logic ;
      xfer_rd_init  : out    std_logic ;
      xfer_wr_init  : out    std_logic 
   );
   end component;
   component register_array_resetval
   generic (
      addr_width_g : integer := 8;      --width of address
      data_width_g : integer := 8;      --width of data
      addr_base_g  : std_logic_vector;
      addr_range_g : std_logic_vector;
      nregs_g      : integer := 16      --number of registers
   );
   port (
      sbus_o   : out    sbus_o_t ;
      sbus_i   : in     sbus_i_t ;
      resetval : in     std_logic_vector ( nregs_g*data_width_g-1 downto 0 );
      reg_din  : in     std_logic_vector ( nregs_g*data_width_g-1 downto 0 ); -- parallel input for readback
      reg_dout : out    std_logic_vector ( nregs_g*data_width_g-1 downto 0 ); -- parallel output of all registers
      we       : out    std_logic_vector ( nregs_g-1 downto 0);               -- active high write strobes
      reset    : in     std_logic ;                                           -- synchronous, active high reset
      clk      : in     std_logic                                             -- register clock
   );
   end component;

   -- Optional embedded configurations
   -- pragma synthesis_off
   for all : axi_xfer_ctrl use entity axi_mst_sbus_bridge.axi_xfer_ctrl;
   for all : cnt_modulus use entity axi_mst_sbus_bridge.cnt_modulus;
   for all : cnt_modulus_c use entity axi_mst_sbus_bridge.cnt_modulus_c;
   for all : fifo_distram use entity axi_mst_sbus_bridge.fifo_distram;
   for all : fifo_stream_ctrl use entity axi_mst_sbus_bridge.fifo_stream_ctrl;
   for all : register_array_resetval use entity axi_mst_sbus_bridge.register_array_resetval;
   -- pragma synthesis_on


begin
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   threshold <= fifo_threshold;--X"0010"; 
   xfer_rd_en <= xfer_read and xfer_rd_continuous and xfer_enable;    
   xfer_wr_en <= xfer_write and xfer_wr_continuous and xfer_enable;                            

   -- HDL Embedded Text Block 2 reg_slice
   --slice registers from vector---------------
   reg00 <= reg_dout( 0*32+31 downto 0*32);
   reg01 <= reg_dout( 1*32+31 downto 1*32);
   reg02 <= reg_dout( 2*32+31 downto 2*32);
   reg03 <= reg_dout( 3*32+31 downto 3*32);
   reg04 <= reg_dout( 4*32+31 downto 4*32);
   reg05 <= reg_dout( 5*32+31 downto 5*32);
   reg06 <= reg_dout( 6*32+31 downto 6*32);
   reg07 <= reg_dout( 7*32+31 downto 7*32);
   reg08 <= reg_dout( 8*32+31 downto 8*32);
   reg09 <= reg_dout( 9*32+31 downto 9*32);
   reg0A <= reg_dout( 10*32+31 downto 10*32);
   reg0B <= reg_dout( 11*32+31 downto 11*32);
   reg0C <= reg_dout( 12*32+31 downto 12*32);
   reg0D <= reg_dout( 13*32+31 downto 13*32);
   reg0E <= reg_dout( 14*32+31 downto 14*32);
   reg0F <= reg_dout( 15*32+31 downto 15*32);
   --spare register if more are needed
   --reg10 <= reg_dout( 16*32+31 downto 16*32);
   --reg11 <= reg_dout( 17*32+31 downto 17*32);
   --reg12 <= reg_dout( 18*32+31 downto 18*32);
   --reg13 <= reg_dout( 19*32+31 downto 19*32);
   --reg14 <= reg_dout( 20*32+31 downto 20*32);
   --reg15 <= reg_dout( 21*32+31 downto 21*32);
   --reg16 <= reg_dout( 22*32+31 downto 22*32);
   --reg17 <= reg_dout( 23*32+31 downto 23*32);
   
   ---readback register values----
   process(clk)
   begin
      if rising_edge(clk) then
            -- default assignment----------
            reg_din <= reg_dout; 
           --readback registers-----
            reg_din(0*32+31 downto 0*32) <= reg00_in;
            reg_din(1*32+31 downto 1*32) <= reg01_in;
            reg_din(2*32+31 downto 2*32) <= reg02_in;
    --        reg_din(8*32+31 downto 8*32) <= reg08_in;
           reg_din(9*32+31 downto 9*32) <= reg09_in;
            reg_din(10*32+31 downto 10*32) <= reg0A_in;
    --       reg_din(11*32+31 downto 11*32) <= reg0B_in;
            reg_din(12*32+31 downto 12*32) <= reg0C_in;
    --        reg_din(13*32+31 downto 13*32) <= reg0D_in;
       --     reg_din(14*32+31 downto 14*32) <= reg0E_in;
        --    reg_din(15*32+31 downto 15*32) <= reg0F_in;
      end if;
   end process;
                                    
   

   -- HDL Embedded Text Block 3 eb2
   xfer_wr_reset <= not fifo_wr_flush;
   --xfer_wr_reset <= not fifo_wr_enable;
   xfer_rd_reset  <= not fifo_rd_enable;                                    

   -- HDL Embedded Text Block 4 interrupt_logic
   process(clk)
   begin
      if rising_edge(clk) then
           irq <= irq_flag and irq_mask;     
      end if;
   end process;
   
   process(clk)
   begin
      if rising_edge(clk) then
          if reset = '1' or irq_clear='1'  then
             irq_flag<= '0';
          elsif  irq_delayed = '1' then
              irq_flag <= '1';
          end if;
      end if;
   end process;
   
   --counter to create an interrupt  delayed by 1usec ------
   --the interrupt is fired 1us after xfer_init is asserted ---
   process(clk)
   begin
      if rising_edge(clk) then
          if reset = '1' then
             irq_delay_cnt <= (others => '0');
          elsif  xfer_init = '1' then
              irq_delay_cnt <= conv_std_logic_vector(100,irq_delay_cnt'length);
          elsif irq_delay_cnt /= 0 then
              irq_delay_cnt <= irq_delay_cnt-1;
          end if;
      end if;
   end process;
   
   ---delayed interrupt ------------------
   irq_delayed <= '1' when irq_delay_cnt = 1 else '0';
   
   -- detect uncleared interrupts------
   process(clk)
   begin
      if rising_edge(clk) then
          if reset = '1' or irq_err_cnt_clear='1'  then
             irq_err_cnt <=  (others => '0');
          elsif  irq_flag = '1' and irq_delayed = '1' then
              irq_err_cnt <=  irq_err_cnt +1;
          end if;
      end if;
   end process;

   -- HDL Embedded Text Block 5 regs
   -----register assignments-----
   --REGISTER 0
   reg00_in <= conv_std_logic_vector(hw_serial_number_g,16) & conv_std_logic_vector(hw_version_g,16);
   --REGISTER 1
   reg01_in <= timestamp;
   --REGISTER 2
   irq_clear<= reg_we(2) and reg02(1);                 --set bit0 of reg02
   irq_err_cnt_clear<= reg_we(2) and reg02(3);   --set bit3 of reg02
   irq_mask <= reg02(0);
   reg02_in <= reg02(31 downto 2) & irq_flag & reg02(0); 
   --REGISTER 3
   xfer_cnt_enable <= '0' when reg03 = 0 else '1'; 
   xfer_cycle_modulus <= reg03; --conv_std_logic_vector(125,32);    
   --REGISTER 4
   xfer_wr_base_address <= reg04;
   --REGISTER 5
   xfer_rd_base_address <= reg05;
   --REGISTER 6
   xfer_enable <= reg06(16);
   xfer_write <= reg06(0); 
   xfer_wr_continuous <= reg06(1);
   xfer_wr_snapshot <= reg_we(6) and reg06(2);
   xfer_read <= reg06(8); 
   xfer_rd_continuous <= reg06(9);
   xfer_rd_snapshot <= reg_we(6) and reg06(10);
   --REGISTER 7
   xfer_select <= reg07(1 downto 0);
   
   --REGISTER 8
   xfer_fifo_size <= reg08;
   --REGISTER 9
   
   --REGISTER 0x0D
   fifo_threshold <= reg0D(15 downto 0);
   arcache <= "0010"; -- reg0D(3 downto 0);
   awcache <= "0010";-- reg0D(7 downto 4); 
   
   --REGISTER 0x0E
   timer0_cycle_modulus <= reg0E;
   timer0_cnt_enable <= '0' when reg0E = 0 else '1'; 
   --REGISTER 0x0F
   timer1_cycle_modulus <= reg0F;
   timer1_cnt_enable <= '0' when reg0F = 0 else '1';   
    

   -- HDL Embedded Text Block 6 eb3
   ----concat readable registers-----
   reg09_in <=  xfer_fifo_rd_ptr;
   reg0A_in <= xfer_fifo_wr_ptr;
   reg0C_in <= irq_err_cnt;
                                   

   -- HDL Embedded Text Block 7 constant_values
   -- constant logic values
   hi <= '1';
   lo <= '0';                                     

   -- HDL Embedded Text Block 8 register_resetval
   --default reset values for registerblock
   process(resetval)
   begin
      resetval <= (others => '0');
      resetval(3*32+31 downto 3*32) <= X"0000007D"; --200kHz cycle rate
      --resetval(6*32+31 downto 6*32) <= X"00010303"; --dma
      --resetval(9*32+31 downto 9*32) <= X"00000010";  
      resetval(13*32+31 downto 13*32) <= X"000000D0"; -- fifo threshold
      resetval(14*32+31 downto 14*32) <= X"000003E8"; --10 us cpu cycle rate
      resetval(15*32+31 downto 15*32) <= X"00000064"; --1 us cpu cycle rate
   end process;                                
   
   
   
   

   -- HDL Embedded Text Block 9 eb5
   xfer_init <= xfer_sync_int when xfer_select = "00" else
                     xfer_sync_ext when xfer_select = "01" else
                    '0';
   xfer_mode <= xfer_select(1);
   
   sync_o(C_SYNC_WIDTH-1 downto 2) <= (others => '0');
   sync_o(1 downto 0) <= timer1 & timer0;


   -- Instance port mappings.
   U_1 : axi_xfer_ctrl
      port map (
         RXN_DONE                  => RXN_DONE,
         TXN_DONE                  => TXN_DONE,
         clk                       => clk,
         fifo_rd_size              => xfer_fifo_size,
         fifo_wr_size              => xfer_fifo_size,
         loopback                  => xfer_loopback,
         rd_continuous             => xfer_rd_continuous,
         rd_snapshot               => xfer_rd_snapshot,
         reset                     => reset,
         wr_continuous             => xfer_wr_continuous,
         wr_snapshot               => xfer_wr_snapshot,
         xfer_enable               => xfer_enable,
         xfer_init                 => xfer_init,
         xfer_mode                 => xfer_mode,
         xfer_num_reset            => xfer_num_reset,
         xfer_rd                   => xfer_read,
         xfer_rd_base_address      => xfer_rd_base_address,
         xfer_rd_init              => xfer_rd_init,
         xfer_rd_reset             => xfer_rd_reset,
         xfer_we                   => xfer_write,
         xfer_wr_base_address      => xfer_wr_base_address,
         xfer_wr_init              => xfer_wr_init,
         xfer_wr_reset             => xfer_wr_reset,
         INIT_AXI_RX               => INIT_AXI_RX,
         INIT_AXI_TX               => INIT_AXI_TX,
         fifo_rd_ptr               => xfer_fifo_rd_ptr,
         fifo_wr_ptr               => xfer_fifo_wr_ptr,
         no_of_bursts_req          => no_of_bursts_req,
         target_slave_base_address => target_slave_base_address,
         xfer_done                 => xfer_done_internal,
         xfer_rd_num_o             => open
      );
   U_3 : cnt_modulus
      generic map (
         n_dout_g => log2(C_CORE_CLOCK_FREQ/1000),
         module_g => C_CORE_CLOCK_FREQ/1000
      )
      port map (
         clk    => clk,
         enable => hi,
         reset  => reset,
         dout   => open,
         cnt_tc => millisec_tc
      );
   U_4 : cnt_modulus
      generic map (
         n_dout_g => 32,
         module_g => 2**30
      )
      port map (
         clk    => clk,
         enable => millisec_tc,
         reset  => reset,
         dout   => timestamp,
         cnt_tc => open
      );
   U_8 : cnt_modulus_c
      generic map (
         width_g => 32
      )
      port map (
         clk     => clk,
         reset   => reset,
         enable  => xfer_cnt_enable,
         modulus => xfer_cycle_modulus,
         cnt_tc  => xfer_sync_int,
         cnt     => open
      );
   U_9 : cnt_modulus_c
      generic map (
         width_g => 32
      )
      port map (
         clk     => clk,
         reset   => reset,
         enable  => timer0_cnt_enable,
         modulus => timer0_cycle_modulus,
         cnt_tc  => timer0,
         cnt     => open
      );
   U_10 : cnt_modulus_c
      generic map (
         width_g => 32
      )
      port map (
         clk     => clk,
         reset   => reset,
         enable  => timer1_cnt_enable,
         modulus => timer1_cycle_modulus,
         cnt_tc  => timer1,
         cnt     => open
      );
   U_2_dist : fifo_distram
      generic map (
         awidth_g => 9,
         dwidth_g => 64
      )
      port map (
         clk       => clk,
         reset     => reset,
         we_ack    => open,
         wdata     => rd_data,
         we        => rd_next,
         rd_ack    => open,
         fifo_en   => fifo_rd_enable,
         fifo_size => fifo_rd_size_internal,
         rdata     => fifo_rdata,
         rd        => fifo_rd
      );
   U_5_dist : fifo_distram
      generic map (
         awidth_g => 9,
         dwidth_g => 64
      )
      port map (
         clk       => clk,
         reset     => reset,
         we_ack    => open,
         wdata     => fifo_wdata,
         we        => fifo_we,
         rd_ack    => open,
         fifo_en   => fifo_wr_flush,
         fifo_size => fifo_wr_size_internal,
         rdata     => we_data,
         rd        => we_next
      );
   U_6 : fifo_stream_ctrl
      port map (
         clk           => clk,
         fifo_rd       => fifo_rd,
         fifo_rd_en    => fifo_rd_enable,
         fifo_rd_size  => fifo_rd_size_internal,
         fifo_wr_en    => fifo_wr_enable,
         fifo_wr_size  => fifo_wr_size_internal,
         reset         => reset,
         threshold     => threshold,
         xfer_done     => xfer_done_internal,
         xfer_rd_en    => xfer_rd_en,
         xfer_wr_en    => xfer_wr_en,
         fifo_wr_flush => fifo_wr_flush,
         xfer_rd_init  => xfer_rd_init,
         xfer_wr_init  => xfer_wr_init
      );
   U_0 : register_array_resetval
      generic map (
         addr_width_g => 16,         --width of address
         data_width_g => 32,         --width of data
         addr_base_g  => X"0000",
         addr_range_g => X"0010",
         nregs_g      => 16          --number of registers
      )
      port map (
         sbus_o   => sbus_o,
         sbus_i   => sbus_i,
         resetval => resetval,
         reg_din  => reg_din,
         reg_dout => reg_dout,
         we       => reg_we,
         reset    => reset,
         clk      => clk
      );

   -- Implicit buffered output assignments
   fifo_rd_size <= fifo_rd_size_internal;
   fifo_wr_size <= fifo_wr_size_internal;
   xfer_done    <= xfer_done_internal;

end struct;

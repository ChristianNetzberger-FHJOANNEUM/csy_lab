--
-- VHDL Architecture training_lib.comp_pulsetrain.rtl
--
-- Created:
--          by - Net.UNKNOWN (KPERSM7467)
--          at - 18:57:26 28.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comp_pulsetrain is
   generic( 
      nbits_g : integer := 16
   );
   port( 
      trigger_i     : in     std_logic;
      period_length : in     std_logic_vector (nbits_g-1 downto 0);
      pulse_length  : in     std_logic_vector (nbits_g-1 downto 0);
      pulse_number  : in     std_logic_vector (nbits_g-1 downto 0);
      enable_i      : in     std_logic;
      reset         : in     std_logic;
      clk           : in     std_logic;
      enable_o      : out    std_logic;
      trigger_o     : out    std_logic;
      pulsetrain    : out    std_logic;
      strobetrain   : out    std_logic;
      laststrobe    : out    std_logic
   );

-- Declarations

end comp_pulsetrain ;

--
architecture rtl of comp_pulsetrain is
  signal cnt_period, cnt_number: std_logic_vector(nbits_g-1 downto 0);
  signal pulsetrain_en, cnt_period_tc: std_logic;
  signal trigger_reg: std_logic;
begin
  
  --counter to create the pulse period-------
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        cnt_period <= (0 => '1',others => '0'); -- start counting from 1, set element 0 of vector to '1'
      elsif pulsetrain_en = '1' then -- enable counter while pulse number counter's terminal count is zero 
        if enable_i = '1' then
          if cnt_period_tc = '1' then
            cnt_period <= (0 => '1', others => '0');-- wrap back to 1
          else
            cnt_period <= cnt_period +1;
          end if;
        end if;
      end if;
    end if;
  end process;
  --comparator to create the terminal count of the period counter--
  cnt_period_tc <= '1' when cnt_period = period_length else '0';
  
  --down-counter to implement the number of pulses----
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        cnt_number <= (others => '0'); 
      elsif trigger_i = '1' then
        cnt_number <= pulse_number;      ---load the counter with initial value
      elsif enable_i = '1' then
        if pulsetrain_en = '1' then
          if cnt_period_tc = '1' then
            cnt_number <= cnt_number -1; --decrement until counter reaches zero
          end if;
        end if;
      end if;
    end if;
  end process;
  
  ---comparator to determine terminal count for the pulsenumber counter
  pulsetrain_en <= '0' when cnt_number = 0 else '1';
 
  -- output signal
  -- comparator to create the on-time of the pulses-----
  pulsetrain <= pulsetrain_en when cnt_period <= pulse_length else '0';
  strobetrain <= cnt_period_tc;

  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        trigger_reg <= '0'; 
      elsif trigger_i = '1' then
        trigger_reg <= '1'; --register the trigger_i strobe
      elsif enable_i = '1' then
        trigger_reg <= '0'; --reset the registered trigger_i strobe
      end if;
    end if;
  end process;
  
  process(clk)
  begin
    if rising_edge(clk) then
      trigger_o <= enable_i and trigger_reg;
      enable_o  <= enable_i;
      if cnt_number = 1 then
         laststrobe <= cnt_period_tc and enable_i;
      end if;
    end if;
  end process;
    
end architecture rtl;


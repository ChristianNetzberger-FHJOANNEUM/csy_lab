--
-- VHDL Architecture training_lib.comp_oneshot.rtl
--
-- Created:
--          by - Net.UNKNOWN (KPERSM7467)
--          at - 01:01:58 28.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comp_oneshot is
   generic( 
      nbits_g : integer := 16
   );
   port( 
      pulse_length : in     std_logic_vector (nbits_g-1 downto 0);
      trigger      : in     std_logic;
      enable       : in     std_logic;
      reset        : in     std_logic;
      clk          : in     std_logic;
      pulse        : out    std_logic
   );

-- Declarations

end comp_oneshot ;

--
architecture rtl of comp_oneshot is
  signal cnt: std_logic_vector(pulse_length'range);
  signal tc: std_logic;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        cnt <= (others => '0');
      elsif trigger = '1' then
        cnt <= pulse_length;
      elsif enable = '1' then
        if tc = '0' then
           cnt <= cnt-1;
        end if;
      end if;  
    end if;
  end process;
  
  --terminal count is zero
  tc <= '1' when cnt = 0 else '0';
  
  pulse <= not tc;
    
end architecture rtl;


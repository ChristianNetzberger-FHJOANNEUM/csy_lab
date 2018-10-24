--
-- VHDL Architecture training_lib.comp_delay.rtl
--
-- Created:
--          by - Net.UNKNOWN (KPERSM7467)
--          at - 23:31:00 29.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity comp_delay_bit is
   generic( 
      delay_g : integer := 1
   );
   port( 
      din   : in     std_logic;
      reset : in     std_logic;
      clk   : in     std_logic;
      din_q : out    std_logic
   );

-- Declarations

end comp_delay_bit ;

--
architecture rtl of comp_delay_bit is
  signal sreg: std_logic_vector(delay_g-1 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        sreg <= (others => '0');
      else
        sreg(0) <= din;
         for i in 1 to sreg'left loop
           sreg(i) <= sreg(i-1);
         end loop;
      end if;
    end if;
  end process; 
  din_q <= sreg(sreg'left);   
end architecture rtl;


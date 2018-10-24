--
-- VHDL Architecture gidas_lib.awgn_lutaddr.rtl
--
-- Created:
--          by - Net.UNKNOWN (KPERSM7467)
--          at - 21:45:10 24.08.2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity lfsr is
  generic(
    seed_g: integer := 1
  );
   port( 
      clk       : in     std_logic;
      en        : in     std_logic;
      reset     : in     std_logic;
      lfsr_din  : in    std_logic;
      lfsr_dout : out    std_logic
   );

-- Declarations

end lfsr ;

--
architecture rtl of lfsr is
  
   function lfsr_gen(shr: std_logic_vector; polygen: std_logic_vector) return std_logic_vector is
      variable shr_tmp: std_logic_vector(shr'range);
   begin
      if shr(shr'left) = '1' then
         shr_tmp :=  (shr(shr'length-2 downto 0) & '0') xor polygen;
      else
         shr_tmp :=  (shr(shr'length-2 downto 0) & '0');
      end if;
      return(shr_tmp);
  end function lfsr_gen;

  signal polygen0: std_logic_vector( 4 downto 0) :=                 "01001";  -- x^^5  + x^^3  + 1
  signal polygen1: std_logic_vector( 5 downto 0) :=                "100001";  -- x^^6  + x^^5  + 1
  signal polygen2: std_logic_vector( 6 downto 0) :=               "1000001";  -- x^^7  + x^^6  + 1
  signal polygen3: std_logic_vector( 9 downto 0) :=            "0010000001";  -- x^^10 + x^^7  + 1
  signal polygen4: std_logic_vector(10 downto 0) :=           "01000000001";  -- x^^11 + x^^9  + 1
  signal polygen5: std_logic_vector(14 downto 0) :=       "100000000000001";  -- x^^15 + x^^14 + 1
  signal polygen6: std_logic_vector(16 downto 0) :=     "00100000000000001";  -- x^^17 + x^^14 + 1
  signal polygen7: std_logic_vector(17 downto 0) :=    "000000100000000001";  -- x^^18 + x^^11 + 1
  signal polygen8: std_logic_vector(19 downto 0) :=  "00100000000000000001";  -- x^^20 + x^^17 + 1
  signal polygen9: std_logic_vector(20 downto 0) := "010000000000000000001";  -- x^^21 + x^^19 + 1

  signal polygen10: std_logic_vector( 4 downto 0) :=                  "01001";  -- x^^5  + x^^3  + 1
  signal polygen11: std_logic_vector( 5 downto 0) :=                 "100001";  -- x^^6  + x^^5  + 1
  signal polygen12: std_logic_vector( 6 downto 0) :=                "1000001";  -- x^^7  + x^^6  + 1
  signal polygen13: std_logic_vector( 9 downto 0) :=             "0010000001";  -- x^^10 + x^^7  + 1
  signal polygen14: std_logic_vector(10 downto 0) :=            "01000000001";  -- x^^11 + x^^9  + 1
  signal polygen15: std_logic_vector(14 downto 0) :=        "100000000000001";  -- x^^15 + x^^14 + 1
  signal polygen16: std_logic_vector(16 downto 0) :=      "00100000000000001";  -- x^^17 + x^^14 + 1
  signal polygen17: std_logic_vector(17 downto 0) :=     "000000100000000001";  -- x^^18 + x^^11 + 1
  signal polygen18: std_logic_vector(19 downto 0) :=   "00100000000000000001";  -- x^^20 + x^^17 + 1
  signal polygen19: std_logic_vector(21 downto 0) := "1000000000000000000001";  -- x^^22 + x^^21 + 1

  

  signal shreg: std_logic_vector(polygen4'range);
  begin
    
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        shreg <= conv_std_logic_vector(seed_g, shreg'length); 
      elsif en = '1' then
        shreg <= lfsr_gen(shreg,polygen4);
      end if;    
    end if;
  end process;

  lfsr_dout <= shreg(0);
     
end architecture rtl;


--It scales the timer output from 1:1 to 1:16, 
--so interrupt occurs after every 1...16 timer loops.
--(Instead of every loop)
--Postscaler (1:1, 1:2, 1:4, 1:8)
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_bit.all;
entity postscaler is 
  port(
    Fin,Rst,En: in std_logic;--Fin is the clk
    K: in std_logic_vector(2 downto 0);--K is the choice
    OVF: out std_logic
  );
end postscaler;

architecture post of postscaler is  
 component updff is
  port(en,rst,clk:in std_logic;
	     data:in std_logic_vector(7  downto 0);
	 	   q:inout std_logic_vector(7 downto 0);
	     OVF:out std_logic );
  end component;
  
signal  Cnt_Ovf: std_logic;
signal temp,Cnt_Out:std_logic_vector(7 downto 0);
signal reset:std_logic;
--signal Q:  std_logic_vector(7 downto 0);
begin
  --K 000 = 1:8
  --K 001 = 1:1
  --K 010 = 1:2
  --K 100 = 1:4
  temp<="00000001" when En/='1'
  else "00001"&K when K="000" 
  else "00000"&K;
  reset<=RST when En='1' 
  else '1';

--process(Fin)
  --  begin
      --if rising_edge(Fin)then
 --if Cnt_Out=temp then
   -- Ovf<='1'  ;
  --else Ovf<='0' ;
 --end if;
-- end if;
--end process;
OVF<=Fin when Cnt_Ovf='1'else '0';

  counter:  updff port map(En,RST,Fin,temp,Cnt_Out,Cnt_Ovf);


end post;





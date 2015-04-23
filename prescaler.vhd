Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_bit.all;
entity prescaler is 
  port(
    Fin,Rst,En: in std_logic;
    K: in std_logic_vector(2 downto 0);
    --Data: in std_logic_vector(7 downto 0);
    Fout: out std_logic
    --OVF: out std_logic
  );
end prescaler;

architecture pre of prescaler is
  signal Q : std_logic_vector(7 downto 0);
  signal org,Cnt_Ovf: std_logic;
  signal Y,Rst_cnt: std_logic;

  component updff is
  	port(en,rst,clk:in std_logic;
	     data:in std_logic_vector(7  downto 0);
	 	   q:inout std_logic_vector(7 downto 0);
	     OVF:out std_logic );
  end component;
  
begin
  org<=Fin;
  counter: updff port map(En,rst,Fin,"11111111",Q,Cnt_Ovf);
 
 MUX: process(K,Q,org,Fin)
  variable A:std_logic_vector(8 downto 0);
  subtype small_int is integer range 0 to 4 ;
  variable conv : small_int;
  begin
    if(rising_edge(Fin))then
    A:=(Q & org);
    --if K="000" then 
      --conv:=0;
    if K="001" then
      conv:=1;
    elsif K="010" then
      conv:=2;
    elsif K="011" then
      conv:=3;
     elsif K="100" then
      conv:=4;
    end if;
    Y<=A(conv);
    --Y<=A(CONV_INTEGER(K));
  end if;
  end process;
  Fout<=Y when K/="000" else Fin;
  
end pre;

--K 000 = 1:1
--K 001 = 1:2
--K 010 = 1:4
--K 011 = 1:8
--K 100 = 1:16


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
  --process(Q,En,Rst,Data,fin)
  -- begin

        --if Q=Data and rising_edge(Y) then
        -- OVF<='1';
        --elsif Q=Data and rising_edge(Fin) then
        --   Rst_cnt<='1';
        --else
        --  Rst_cnt<=Rst;
        --  OVF<='0';
        --end if;

  	--end process;
  
--OVF<='1'when Q=Data and rising_edge(Fin) else '0';
-- Rst_cnt<='1' when Q=Data else Rst;
 MUX: process(K,Q,org,Fin)
  variable A:std_logic_vector(8 downto 0);
  begin
    if(rising_edge(Fin))then
    A:=(Q & org);
    Y<=A(CONV_INTEGER(K));
  end if;
  end process;
  Fout<=Y;
  
end pre;

--K 000 = 1:1
--K 001 = 1:2
--K 010 = 1:4
--K 011 = 1:8
--K 100 = 1:16

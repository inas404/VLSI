--Timer1
-- Works on Addresses starts from 0x44
-- Load Data & Configuration from Databus
-- Works on System Internal Clock only
-- 8-bit Timer Period
-- 4 mode Prescaler (1:2, 1:4, 1:8, 1:16)
-- 4-mode Postscaler (1:1, 1:2, 1:4, 1:8)
-- Interrupt overflow
Library ieee;
Use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_bit.all;
entity timer1 is 
	port ( 
	       Add_Bus : in std_logic_vector(7 downto 0);
	       Data_Bus : in std_logic_vector(7 downto 0);
	       Enable_Bus,En,Clk,R_W,Rst :in std_logic;
	       Ovf: out std_logic
		    );
end entity timer1;
architecture  Data_flow of timer1 is
	signal Data12 ,Control,Counter_Out : std_logic_vector(7 downto 0);
	signal Fout_Pre,Cnt_Ovf: std_logic;
	signal Pre_Mode,Post_Mode: std_logic_vector(2 downto 0);
	
	component prescaler is 
	port(
    Fin,Rst,En: in std_logic;
    K: in std_logic_vector(2 downto 0);
    Fout: out std_logic
  );
	end component;
 
   component updff is
  	port(en,rst,clk:in std_logic;
	     data:in std_logic_vector(7  downto 0);
	 	   q:inout std_logic_vector(7 downto 0);
	     OVF:out std_logic );
  end component;
	component postscaler is 
  port(
    Fin,Rst,En: in std_logic;--Fin is the clk
    K: in std_logic_vector(2 downto 0);--K is the choice
    OVF: out std_logic
  );
	end component;
	 

	begin
	  Pre_Mode<=Control(5 downto 3)when Control(6)='1' else "000";
	  Post_Mode<=Control(2 downto 0)when Control(7)='1' else "111";

	  pre: prescaler port map(Clk,Rst,En,Pre_Mode,Fout_Pre);
	  cnt1: updff port map(En,Rst,Fout_Pre,Data12,Counter_Out,Cnt_Ovf);
    post: postscaler port map(Cnt_Ovf,Rst,En,Post_Mode,Ovf);
	   process(Clk)
		  begin
				if(Add_Bus(1)='0' and Add_Bus(0) = '0' and Enable_Bus = '1' and En='1' and R_W = '0')then--write D1
				  Data12 <= Data_Bus;
--				  Data12<=Data2-Data1;
--				elsif(Add_Bus(1)='0' and Add_Bus(0) = '1' and Enable_Bus = '1' and En='1' and R_W = '0')then--write D2
--				  Data2 <= Data_Bus;
--				  Data12<=Data2-Data1;
				elsif(Add_Bus(1)='1' and Add_Bus(0) = '0' and Enable_Bus = '1' and En='1' and R_W = '0')then----write control
				  Control <= Data_Bus;
				end if ;
	  end process;
end Data_flow;



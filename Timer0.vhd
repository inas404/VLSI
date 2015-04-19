Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Entity Timer0 is
  port(
  Add_Bus : in std_logic_vector(7 downto 0);
  Data_Bus : inout std_logic_vector(7 downto 0);  
  Enable_Bus,Enable,Clk,Ex_Clk,R_W,Rst : in std_logic;
  Overflow : out std_logic );
end Timer0;

Architecture arch_Timer0 of Timer0 is
signal Final_Clk,Syn_Clk: std_logic;
signal Data ,Control,Currnt_Data,temp: std_logic_vector(7 downto 0);
component tri_state_buffer is
    Port ( EN   : in  STD_LOGIC;    -- single buffer enable
           Input  : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Counter0 is 
  port (clk,rst,EN: in std_logic;
        Overflow :out std_logic; 
        input: in std_logic_vector (7 downto 0);
        output: out std_logic_vector (7 downto 0));
end component;
component DFF is
    Port ( D : in std_logic;
           CLK : in std_logic;
           Q : out std_logic);
end component;
  begin
  U0 : DFF port map (Ex_Clk,Clk,Syn_Clk);
  U1 : counter0 port map (Final_Clk,Rst,Enable,Overflow,Data,Currnt_Data);  
  U2 : tri_state_buffer port map(Enable_Bus,temp,Data_Bus); 
   Final_Clk <= Clk xor Control(2) when Control(0) = '1'
   else  Syn_Clk Xor Control(2) when Control(1) = '1'
   else  Ex_Clk xor Control(2);
     
   Data <=Data_Bus when Enable='1' and Add_Bus(0) = '0' and Enable_Bus = '1' and R_W = '0';
   Control <=Data_Bus when Enable='1' and Add_Bus(0) = '1' and Enable_Bus = '1' and R_W = '0';
   temp <=Currnt_Data when Enable='1' and Add_Bus(0) = '0' and Enable_Bus = '1' and R_W = '1'
   else Control when Enable='1' and Add_Bus(0) = '1' and Enable_Bus = '1' and R_W = '1' ;
--   Data_Bus <= temp2; 
  -- Data_Bus <= temp when Enable='1' and Enable_Bus='1' and R_W='1';
     --if(Control(7) = '1')then
     --Final_Clk <= Clk xor Control(5);
   --elsif(Control(6) = '1')then
    -- Final_Clk <= Syn_Clk Xor Control(5);
   --else Final_Clk <= Ex_Clk xor Control(5); 
  --end if ;
  end arch_Timer0;




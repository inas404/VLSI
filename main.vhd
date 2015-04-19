Library ieee;
use ieee.std_logic_1164.all;

Entity Integration is
  port(
  Add_Bus : in std_logic_vector(7 downto 0);
  Data_Bus : inout std_logic_vector(7 downto 0);
  Enable,Clk,Ex_Clk,R_W,Rst : in std_logic);
end Integration;

Architecture arch_Integration of Integration is
component Timer0 is
 port(
Add_Bus : in std_logic_vector(7 downto 0);
Data_Bus : inout std_logic_vector(7 downto 0);  
Enable_Bus,Enable,Clk,Ex_Clk,R_W,Rst : in std_logic;
Overflow : out std_logic );
end component;
component timer1 is 
	port ( 
	       Add_Bus : in std_logic_vector(7 downto 0);
	       Data_Bus : inout std_logic_vector(7 downto 0);
	       Enable_Bus,En,Clk,R_W,Rst :in std_logic;
	       Ovf: out std_logic
--		     Count  : out std_logic_vector(7 downto 0)
		    );
end component;
component PWM is
  PORT(
     CLK,RST,r_w,Enable_Bus,EN: in std_logic;   -- pwm_in is the address bus last bit
     Add_Bus : in STD_LOGIC_VECTOR(7 DOWNTO 0);
     Data_bus : inout STD_LOGIC_VECTOR(7 DOWNTO 0);
      pwm_out   : OUT STD_LOGIC);
end component;
component GPIO is
port (databus : inout std_logic_vector(7 downto 0);	
   addressbus : in std_logic_vector(7 downto 0);	
 Timer0,Timer1,PWM : in std_logic;			--Data
 Rd_Wr: in std_logic;				--Rd_Wr 0 Wr/1 Rd
CLK,Rst,Enable_Bus,EN : in std_logic	      
);	
end component;
signal Ovf0,Ovf1,V2 :std_logic;  
signal Enable_Bus :std_logic_vector(3 downto 0);  
  begin
U0:Timer0 port map (Add_Bus,Data_Bus,Enable_Bus(0),Enable,Clk,Ex_Clk,R_W,Rst,Ovf0); 
U1:timer1 port map (Add_Bus,Data_Bus,Enable_Bus(1),Enable,Clk,R_W,Rst,Ovf1);   
U2:PWM port map (Clk,Rst,R_W,Enable_Bus(2),Enable,Add_Bus,Data_Bus,V2);
U3:GPIO port map (Data_Bus ,Add_Bus,Ovf0,Ovf1,V2,R_W,Clk,Rst,Enable_Bus(3),Enable);        

Enable_Bus <="0001" when Add_Bus="00101000" or Add_Bus="00101001"
else "0010" when Add_Bus="00101100" or Add_Bus="00101101" or Add_Bus="00101110"
else "0100" when Add_Bus="00110000" or Add_Bus="00110001"
else "1000" when Add_Bus="01000000" or Add_Bus="01000001" or Add_Bus="01000010";
  
  end arch_Integration;



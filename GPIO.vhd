library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

Entity GPIO is
	port (databus : inout std_logic_vector(7 downto 0);	
	      addressbus : in std_logic_vector(7 downto 0);			--addressbus(1),addressbus(0) selector 00 pins /01 configuration/ 10 pins IO control
	      Timer0,Timer1,PWM : in std_logic;			--Data
	      Rd_Wr: in std_logic;				--Rd_Wr 0 Wr/1 Rd
	      CLK,Rst,Enable_Bus,EN : in std_logic	      
	);
end entity GPIO;

architecture my_gpio of GPIO is
------------------------------Components-------------------------
Component my_nDFF is
	port( Clk,Rst : in std_logic;
	      EN : in std_logic_vector (7 downto 0);
	      d : in std_logic_vector(7 downto 0);
	      q : out std_logic_vector(7 downto 0));
end Component;	
component mux2  is  
	port (a,b: in std_logic;
	      s0 : in std_logic ; 
	      x : out std_logic
	      );    
end component ;
component tri_state_buffer is
    Port ( EN   : in  STD_LOGIC;    -- single buffer enable
           Input  : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end component;


------------------------------Components-------------------------
signal cntregin,cntregout,cntregen,temp,temp2,pinsout1: std_logic_vector(7 downto 0);        --Configuration register D
signal pinsin,pinsout,pinsen,pinsIOcon,pinIO,pinseninv,pinsdata: std_logic_vector(7 downto 0);              --Pins register Q
begin 
U0:tri_state_buffer port map(Enable_Bus,temp,databus); 
process(CLK)
begin

if Enable_Bus='1' then
	if addressbus(1)='1' and addressbus(0)='0' then
	pinIO<=(others =>'1');
	pinsIOcon <= databus;
	
	elsif Rd_Wr = '0' and addressbus(0) = '0'  then        --Write Pins
		pinsin(4 downto 0) <=databus( 4 downto 0);
		cntregin <= ( others =>'1');
		cntregen <= (others=>'1');
		elsif  Rd_Wr = '0' and addressbus(0) = '1'  then	--Write Configuration
		cntregin <=   databus;
		cntregen <= (others=>'1');
		elsif  Rd_Wr = '1' and addressbus(0) = '0'  then	--Read Pins
		pinseninv<= not pinsen;
		temp<=pinsdata;
		else						--Read Configuration
		temp <=   cntregout ;	        
		
	end if;
end if;
if Rst='1' then 
	pinsout<=(others=>'0');
end if;
pinsout<=pinsout1;
end process;
	------------------------------Registers----------------------------
	control_reg: my_nDFF port map(CLK,Rst,cntregen,cntregin,cntregout);	-- control register
	pinsread: my_nDFF port map(CLK,Rst,pinseninv,pinsout,pinsdata);	        	-- Pins register
	pinswrite: my_nDFF port map(CLK,Rst,pinsen,pinsin,pinsout1); 
	TRIS: my_nDFF port map(CLK,Rst,pinIO,pinsIOcon,pinsen);                                       --TRIS register (PINs controller)
	---------------------------------MUX-------------------------------
	PWMMUX : mux2 port map(PWM,databus(7),cntregout(7),pinsin(7));                  -- PWM BIT MUX
	Timer1MUX : mux2 port map(Timer1,databus(6),cntregout(6),pinsin(6));            -- Timer1 BIT MUX
	Timer0MUX : mux2 port map(Timer0,databus(5),cntregout(5),pinsin(5));            -- Timer0 BIT MUX
	
end architecture my_gpio;

-------------------------Configuration------------------------
--cntregout(7)--> PWM selector
--cntregout(6)--> Timer1 selector
--cntregout(5)--> Timer0 selector

------------------------------Pins----------------------------
--pinsin(7)--> PWM selector
--pinsin(6)--> Timer1 selector
--pinsin(5)--> Timer0 selector


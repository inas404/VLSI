Library ieee;
Use ieee.std_logic_1164.all;

entity mux2  is  
	port (a,b: in std_logic;
	      s0 : in std_logic ; 
	      x : out std_logic
);    
end entity mux2 ;


-- take care of the usage of when else 
architecture  Data_flow of mux2 is
begin
	x<=a when s0='0' 
	else b;
end architecture Data_flow;

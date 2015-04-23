library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity updff is
	port(en,rst,clk:in std_logic;
	     data:in std_logic_vector(7  downto 0);
	 	   q:inout std_logic_vector(7 downto 0);
	     OVF:out std_logic );
end updff;
architecture Behavioral of updff is
  component my_DFF is
port( d,clk,rst,EN : in std_logic;
q , qinv : out std_logic);
end component;

  signal a,b,c,d,e,f,g,h,rst_sig : std_logic;
  signal q_sig,q_sigb : std_logic_vector(7 downto 0);
  begin
  
  			a<=not q_sig(0);
			b<=(q_sig(0) xor q_sig(1));
			c<= (q_sig(0) and q_sig(1)) xor q_sig(2);
			d<=(q_sig(0) and q_sig(1) and q_sig(2)) xor q_sig(3);
			e<=(q_sig(0) and q_sig(1) and q_sig(2) and q_sig(3)) xor q_sig(4);
			f<=(q_sig(0) and q_sig(1) and q_sig(2) and q_sig(3) and q_sig(4)) xor q_sig(5);
			g<=(q_sig(0) and q_sig(1) and q_sig(2) and q_sig(3) and q_sig(4) and q_sig(5)) xor q_sig(6);
			h<=(q_sig(0) and q_sig(1) and q_sig(2) and q_sig(3) and q_sig(4) and q_sig(5) and q_sig(6)) xor q_sig(7);

			q<= q_sig;
      
			rst_sig<='1' when q_sig=data 
			else rst;
			

			D1 : my_DFF port map(a,clk,rst_sig,en,q_sig(0),q_sigb(0));
			D2 : my_DFF port map(b,clk,rst_sig,en,q_sig(1),q_sigb(1));
			D3 : my_DFF port map(c,clk,rst_sig,en,q_sig(2),q_sigb(2));
			D4 : my_DFF port map(d,clk,rst_sig,en,q_sig(3),q_sigb(3));
			D5 : my_DFF port map(e,clk,rst_sig,en,q_sig(4),q_sigb(4));
			D6 : my_DFF port map(f,clk,rst_sig,en,q_sig(5),q_sigb(5));
			D7 : my_DFF port map(g,clk,rst_sig,en,q_sig(6),q_sigb(6));	
			D8 : my_DFF port map(h,clk,rst_sig,en,q_sig(7),q_sigb(7));
	
			process(q_sig,rst,clk)
				begin
				if (q_sig=data and rst/='1') then
						OVF <='1';	
				elsif rst='1' then		
						OVF <='0';
				elsif rising_edge(clk) then
						OVF <='0';
				end if;
			end process;

	
end Behavioral;





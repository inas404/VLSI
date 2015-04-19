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
  signal qb,q_sig,q_sigb : std_logic_vector(7 downto 0);
  begin
    process(clk,rst,EN )
      begin
     if  rst='0' and EN ='1'  then
       
			
			a<=not q_sig(0);
			b<=(q_sig(0) xor q_sig(1));
			c<= (q_sig(0) and q_sig(1)and q_sigb(2)) or (q_sig(2) and (q_sigb(0) or q_sigb(1)));
			d<=((q_sigb(0) or q_sigb(1) or q_sigb(2))and q_sig(3))or (q_sig(0) and q_sig(1) and q_sig(2) and q_sigb(3));
			e<=(q_sig(0)and q_sig(1) and q_sig(2) and q_sig(3) and q_sigb(4)) or (q_sig(4)and (q_sigb(0) or q_sigb(1)or q_sigb(2) or q_sigb(3) ));
			f<=(q_sig(0)and q_sig(1) and q_sig(2) and q_sig(3) and q_sig(4) and q_sigb(5)) or (q_sig(5)and (q_sigb(0) or q_sigb(1)or q_sigb(2) or q_sigb(3) or q_sigb(4)));
			g<=(q_sig(0)and q_sig(1) and q_sig(2) and q_sig(3) and q_sig(4) and q_sig(5) and q_sigb(6)) or (q_sig(6)and (q_sigb(0) or q_sigb(1)or q_sigb(2) or q_sigb(3) or q_sigb(4) or q_sigb(5)));
			h<=(q_sig(0)and q_sig(1) and q_sig(2) and q_sig(3) and q_sig(4) and q_sig(5) and q_sig(6) and q_sigb(7)) or (q_sig(7)and (q_sigb(0) or q_sigb(1)or q_sigb(2) or q_sigb(3) or q_sigb(4) or q_sigb(5) or q_sigb(6)));
    
		--else
		--	q_sig<=(others=>'0');
		end if;
		if rst ='1'  then q<="00000000"; else q<=q_sig; end if;

	end process; 
	OVF<='1' when q=data else '0';
	rst_sig<='1' when q=data else rst;--<='1' when q=data else '0';
	--q<="00000000" when rst_sig='1'else  q_sig;
	--q<=(others=>'0') when q_sig=data else q_sig; 
	qb<=(others=>'1') when q_sigb= not data else q_sigb; 
	D1 : my_DFF port map(a,clk,rst_sig,en,q_sig(0),q_sigb(0));
	D2 : my_DFF port map(b,clk,rst_sig,en,q_sig(1),q_sigb(1));
	D3 : my_DFF port map(c,clk,rst_sig,en,q_sig(2),q_sigb(2));
	D4 : my_DFF port map(d,clk,rst_sig,en,q_sig(3),q_sigb(3));
	D5 : my_DFF port map(e,clk,rst_sig,en,q_sig(4),q_sigb(4));
	D6 : my_DFF port map(f,clk,rst_sig,en,q_sig(5),q_sigb(5));
	D7 : my_DFF port map(g,clk,rst_sig,en,q_sig(6),q_sigb(6));	
	D8 : my_DFF port map(h,clk,rst_sig,en,q_sig(7),q_sigb(7));
	
end Behavioral;





Library ieee;
Use ieee.std_logic_1164.all;

Entity my_nDFF is
	port( Clk,Rst : in std_logic;
	      EN : in std_logic_vector (7 downto 0);
	      d : in std_logic_vector(7 downto 0);
	      q ,qinv: out std_logic_vector(7 downto 0));
end my_nDFF;

Architecture a_my_nDFF of my_nDFF is

Component my_DFF is
          port( d,Clk,Rst,EN : in std_logic;
          q,qinv : out std_logic);
end component;

begin
loop1: for i in 0 to 7 generate
	fx: my_DFF port map(d(i),Clk,Rst,EN(i),q(i),qinv(i));
end generate;

end a_my_nDFF;

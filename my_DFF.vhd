Library ieee;
use ieee.std_logic_1164.all;
Entity my_DFF is
port( d,clk,rst,EN : in std_logic;
q , qinv : out std_logic);
end my_DFF;

Architecture a_my_DFF of my_DFF is
begin
process(clk,rst)
variable a : std_logic;
begin
if( rst = '1' ) then
        a := '0';
elsif clk'event and clk = '1' and EN = '1' then
 	      a := d;
end if;
q<=a;
qinv<=not a;
end process;
end a_my_DFF;
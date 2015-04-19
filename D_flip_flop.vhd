Library ieee;
use ieee.std_logic_1164.all;

entity DFF is
    Port ( D : in std_logic;
           CLK : in std_logic;
           Q : out std_logic);
end DFF;

architecture arch_DFF of DFF is
begin
            process (CLK)
            begin
                        if CLK = '1' then
                        Q <= D;
                        end if;
            end process;
end arch_DFF;

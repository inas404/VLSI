library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer is
    Port ( EN   : in  STD_LOGIC;    -- single buffer enable
           Input  : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end tri_state_buffer;

architecture Arch of tri_state_buffer is

begin

    Output <= Input when (EN = '1') else (others=>'Z');

end Arch;
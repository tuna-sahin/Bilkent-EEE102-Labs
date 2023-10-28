library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
  Port (x1,x2 : in  std_logic;
        c , s : out std_logic);
end HA;

architecture Behavioral of HA is

begin
    s <= x1 xor x2;
    c <= x1 and x2;

end Behavioral;
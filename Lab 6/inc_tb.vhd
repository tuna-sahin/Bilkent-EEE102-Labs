library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inc_tb is
end inc_tb;

architecture Behavioral of inc_tb is
    component increment is
          Port (x1: in std_logic_vector(7 downto 0);
               out1 : out std_logic_vector(7 downto 0));
    end component;
    signal x1,out1 : std_logic_vector(7 downto 0);
begin
    inc1 : increment port map(x1 => x1, out1 => out1);

    process begin
        x1 <= "00000000";
        wait for 10ns;
        x1 <= "00000001";
        wait for 10ns;
        x1 <= "00000010";
        wait for 10ns;
        x1 <= "00000011";
        wait for 10ns;
        x1 <= "00000100";
        wait for 10ns;
        x1 <= "11111111";
        wait for 10ns;
        end process;

end Behavioral;

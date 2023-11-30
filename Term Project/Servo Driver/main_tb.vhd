library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is
    component main is
      Port (angle : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            out1 : out std_logic            
            );
    end component;
    signal clk,out1 : std_logic;
    signal angle : std_logic_vector(7 downto 0);
begin
    servo : main port map(angle => angle,clk => clk, out1 => out1);
    process begin --clk
    clk <= '1';
    wait for 5ns;
    clk <= '0';
    wait for 5ns;
    end process;    

    process begin
    if angle = "UUUUUUUU" then
        angle <= "00000000";
    else
        angle <= angle + 1;
    end if;
    wait for 70ms;
    end process;
    
end Behavioral;

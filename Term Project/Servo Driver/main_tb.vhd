library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is
    component main is
      Port (angle : in std_logic_vector(7 downto 0);
            clk,start : in std_logic;
            out1b,out2b,out3b : out std_logic_vector(30 downto 0); 
            outa, outas : out std_logic_vector(7 downto 0); 
            out1 : out std_logic            
            );
    end component;
    signal clk,out1,start : std_logic;
    signal angle : std_logic_vector(7 downto 0);
    signal outa,outas : std_logic_vector(7 downto 0);
    signal out1b,out2b,out3b : std_logic_vector(30 downto 0);
begin
    servo : main port map(angle => angle,clk => clk, out1 => out1,start => start, out1b => out1b, out2b => out2b, out3b => out3b,outa => outa,outas => outas);
    process begin --clk
    clk <= '1';
    wait for 5ns;
    clk <= '0';
    wait for 5ns;
    end process;
    
--    process begin --start
--    start <= '1';
--    wait for 50ns;
--    start <= '0';
--    wait;
--    end process;
    
    angle <= "00000000";
--    process begin
--    if angle = "UUUUUUUU" then
--        angle <= "00000000";
--    else
--        angle <= angle + 1;
--    end if;
--    wait for 70ms;
--    end process;
    
    
end Behavioral;

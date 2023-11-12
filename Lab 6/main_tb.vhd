library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_tb is

end main_tb;

architecture Behavioral of main_tb is
    component main is
     Port (x1,x2 : in std_logic_vector(7 downto 0);
        out1  :out std_logic_vector(7 downto 0);
        out2  : out std_logic_vector(2 downto 0);
        start,clk : in std_logic
        );
    end component;
    
    signal x1,x2,out1 : std_logic_vector(7 downto 0);
    signal start, clk : std_logic;
    signal out2 : std_logic_vector(2 downto 0);
begin
    m1 : main port map (x1 => x1, x2 => x2, out1 => out1, start => start, clk => clk , out2 => out2);
    
    process begin
    clk <= '1';
    wait for 5ns;
    clk <= '0';
    wait for 5ns;
    end process;
    
    process begin
    x1 <= "00000100";
    x2 <= "00000100";
    start <= '1';
    wait for 50ns;
    start <= '0';
    wait for 500ns;
    
    x1 <= "10001100";
    x2 <= "00001100";
    start <= '1';
    wait for 50ns;
    start <= '0';
    wait for 500ns;
    
    end process;

end Behavioral;

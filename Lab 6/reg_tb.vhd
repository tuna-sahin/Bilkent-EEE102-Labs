library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg_tb is
end reg_tb;

architecture Behavioral of reg_tb is
    component reg is
         Port (L : in std_logic_vector(7 downto 0);
               out1 : out std_logic;
               out2 : out std_logic_vector(7 downto 0);
               slk,s,clk : in std_logic);
    end component;
    signal L,out2 : std_logic_vector(7 downto 0);
    signal out1 : std_logic;
    signal slk,s,clk :  std_logic;
begin
    reg1 : reg port map(L => L,out1 => out1,slk => slk, clk => clk ,s => s,out2 => out2);
    process begin
        wait for 5ns;
        clk <= '1';
        wait for 5ns;
        clk <= '0';
    end process;
    
    process begin
        slk <= '1';
        L <= "10011001";
        s <= '0';
        wait for 100ns;
        slk <= '0';
        wait for 500 ns;
        slk <= '1';
        wait for 100ns;
        slk <= '0';
        wait;
    end process;
    
    
end Behavioral;

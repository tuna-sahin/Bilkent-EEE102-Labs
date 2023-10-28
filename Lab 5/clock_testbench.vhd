library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_testbench is
end clock_testbench;

architecture Behavioral of clock_testbench is
    component clock is
         Port (clk,reset: in std_logic;
               anode : out std_logic_vector(3 downto 0));
    end component;
    
    signal clk,reset : std_logic;
    signal anode : std_logic_vector(3 downto 0);
begin
    clock1 : clock port map (clk => clk, reset => reset, anode => anode);
    process
    begin   
        clk <= '1';
        wait for 1ns;  
        clk <= '0';
        wait for 1ns;
    end process;
    
    reset_proc : process
    begin
        reset <= '0';
        wait for 100ns;
        reset <= '1';
        wait for 100ns;
        reset <= '0';
        wait;
     end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b2c_test is
end b2c_test;

architecture Behavioral of b2c_test is
    component binary2cathode is
        Port (in1 : in std_logic_vector(3 downto 0);
              out1: out std_logic_vector(6 downto 0));
    end component;
    
    signal in1 : std_logic_vector(3 downto 0);
    signal out1: std_logic_vector(6 downto 0);     
begin
    b2c1 : binary2cathode port map(in1 => in1,out1 => out1);
    process
    begin
        in1 <= "1010";
        wait for 100ns;
        in1 <= "0000";
        wait for 100ns;
        in1 <= "0010";
        wait for 100ns;
    end process;
    
end Behavioral;

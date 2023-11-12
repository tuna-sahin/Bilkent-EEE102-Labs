library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity increment is
  Port (x1: in std_logic_vector(7 downto 0);
        out1 : out std_logic_vector(7 downto 0));
end increment;

architecture Behavioral of increment is
    component HA is
        Port (x1,x2 : in  std_logic;
        c , s : out std_logic);
    end component;
    signal s1 : std_logic_vector(7 downto 0);
    signal c : std_logic_vector(8 downto 0);
begin
    ha1: HA port map (x1 => x1(0) , x2 => '1'  , c => c(0) , s => s1(0)); 
    ha2: HA port map (x1 => x1(1) , x2 => c(0) , c => c(1) , s => s1(1));
    ha3: HA port map (x1 => x1(2) , x2 => c(1) , c => c(2) , s => s1(2)); 
    ha4: HA port map (x1 => x1(3) , x2 => c(2) , c => c(3) , s => s1(3));
    ha5: HA port map (x1 => x1(4) , x2 => c(3) , c => c(4) , s => s1(4)); 
    ha6: HA port map (x1 => x1(5) , x2 => c(4) , c => c(5) , s => s1(5));
    ha7: HA port map (x1 => x1(6) , x2 => c(5) , c => c(6) , s => s1(6)); 
    ha8: HA port map (x1 => x1(7) , x2 => c(6) , c => c(7) , s => s1(7));
    out1 <= s1;
    

end Behavioral;

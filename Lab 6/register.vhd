library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
  Port (L : in std_logic_vector(7 downto 0);
        out1 : out std_logic;
        out2 : out std_logic_vector(7 downto 0);
        slk,s,clk : in std_logic);
end reg;

architecture Behavioral of reg is
    signal q : std_logic_vector(7 downto 0);
begin
    process(clk,slk) begin
    if rising_edge(clk) then
        if slk = '1' then   
            q <= L;
        else
            q(7) <= s;
            q(6) <= q(7);
            q(5) <= q(6);
            q(4) <= q(5);
            q(3) <= q(4);
            q(2) <= q(3);
            q(1) <= q(2);
            q(0) <= q(1);
        end if;
    end if;
    end process;
    out1 <= q(0);    
    out2 <= q;

end Behavioral;

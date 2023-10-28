library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_ops is
  Port (x1 : in std_logic_vector(3 downto 0);
        op : in std_logic;
        s : out std_logic_vector(3 downto 0);
        out1 : out std_logic);
end shift_ops;

architecture Behavioral of shift_ops is
    signal temp : std_logic_vector(2 downto 0);
begin
    
    process (x1,op)
    begin
        if op = '1' then
            s <= '0' & x1(3 downto 1); -- left aritmetic shift
        else
            s <= x1(2 downto 0) & '0'; -- right aritmetic shift
        end if;
    end process;
    out1 <= op;
end Behavioral;
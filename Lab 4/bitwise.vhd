library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise is
  Port (x1,x2 : in std_logic_vector(3 downto 0);
        op : in std_logic;
        s : out std_logic_vector(3 downto 0);
        out1 : out std_logic);
end bitwise;

architecture Behavioral of bitwise is   
  
begin
    process (x1,x2,op)
    begin
        if op = '1' then
            s <= x1 xor x2;
        else 
            s <= x1 xnor x2;
        end if;
    end process;  
    out1 <= op;      
        
end Behavioral;
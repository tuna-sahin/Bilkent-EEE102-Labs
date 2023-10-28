library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity clock is
  Port (clk,reset: in std_logic;
        anode : out std_logic_vector(3 downto 0));
end clock;

architecture Behavioral of clock is
    signal refresh_counter : std_logic_vector(19 downto 0);
begin
    process(clk,reset)
    begin   
        if reset = '1' then
            refresh_counter <= (others => '0');
        elsif rising_edge(clk) then
            refresh_counter <= refresh_counter + 1;
        end if;
        
        case refresh_counter(19 downto 18) is
           when "00" =>   anode <= "1110";
           when "01" =>   anode <= "1101";
           when "10" =>   anode <= "1011";
           when others => anode <= "0111";
        end case;
    end process;
end Behavioral;

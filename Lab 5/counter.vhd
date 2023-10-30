library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity counter is
  Port (seconds_out : out std_logic_vector(15 downto 0);
        clk,reset : in std_logic);
end counter;

architecture Behavioral of counter is
    signal second_counter : std_logic_vector(27 downto 0);
    signal second_inc: std_logic;
    signal s1,s2,s3,s4 : std_logic_vector(3 downto 0);
begin
    process(clk,reset)
    begin   
        if reset = '1' then
            second_counter <= (others => '0');
        elsif rising_edge(clk) then
            if second_counter = x"5f5e0ff" then
                second_counter <= (others => '0');
                second_inc <= '1';        
            else    
                second_inc <= '0';
                second_counter <= second_counter + 1;
            end if;
        end if;
        
        if reset = '1' then
            s1 <= (others => '0');
            s2 <= (others => '0');
            s3 <= (others => '0');
            s4 <= (others => '0');
        elsif rising_edge(clk) then
            if second_inc = '1' then
                if s4 = "1010" then
                    s4 <= "0000";
                    s3 <= "0000";
                    s2 <= "0000";
                    s1 <= "0000";
                elsif s3 = "1001" then
                    s3 <= "0000";
                    s4 <= s4 + 1;
                elsif s2 = "1001" then
                    s2 <= "0000";
                    s3 <= s3 + 1;
                elsif s1 = "1001" then
                    s1 <= "0000";
                    s2 <= s2 + 1;
                else
                    s1 <= s1 + 1;
                end if;            
            end if;
         end if;          
    end process;
    seconds_out <= s4 & s3 & s2 & s1;
end Behavioral;

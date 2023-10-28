library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity binary2hex is
  Port (input : in std_logic_vector(3 downto 0);
        out1 : out std_logic_vector(6 downto 0));

end binary2hex;

architecture Behavioral of binary2hex is
    
begin
    process(input)
    begin
        case input is
            when "0000" => out1 <= "0000001"; -- "0"     
            when "0001" => out1 <= "1001111"; -- "1" 
            when "0010" => out1 <= "0010010"; -- "2" 
            when "0011" => out1 <= "0000110"; -- "3" 
            when "0100" => out1 <= "1001100"; -- "4" 
            when "0101" => out1 <= "0100100"; -- "5" 
            when "0110" => out1 <= "0100000"; -- "6" 
            when "0111" => out1 <= "0001111"; -- "7" 
            when "1000" => out1 <= "0000000"; -- "8"     
            when "1001" => out1 <= "0000100"; -- "9" 
            when "1010" => out1 <= "0000010"; -- "a"
            when "1011" => out1 <= "1100000"; -- "b"
            when "1100" => out1 <= "0110001"; -- "C"
            when "1101" => out1 <= "1000010"; -- "d"
            when "1110" => out1 <= "0110000"; -- "E"
            when "1111" => out1 <= "0111000"; -- "F"
            end case;
    end process;
end Behavioral;

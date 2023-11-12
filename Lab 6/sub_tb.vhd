----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 11:45:29 AM
-- Design Name: 
-- Module Name: sub_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_tb is
end sub_tb;

architecture Behavioral of sub_tb is
    component subtractor is
         Port (x,y : in std_logic_vector(7 downto 0);
                out1 : out std_logic_vector(7 downto 0)       
              );
    end component;
    
    signal x1,x2,o1 : std_logic_vector(7 downto 0);
begin
    sub : subtractor port map (x => x1,y => x2, out1 => o1);
    process begin
        x1 <= "11111111";
        x2 <= "10010101";
        wait for 10 ns;
        x1 <= "11101100";
        x2 <= "10010100";
        wait for 10 ns;
        x1 <= "00101101";
        x2 <= "01101010";
        wait for 10 ns;
    end process;
end Behavioral;

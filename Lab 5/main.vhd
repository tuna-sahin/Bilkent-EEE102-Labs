library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity main is
    Port ( clock : in std_logic;-- 100Mhz clock on Basys 3 FPGA board
           anode : out std_logic_vector(3 downto 0);-- 4 Anode signals
           input_out : out std_logic_vector (15 downto 0);
           sw : in  std_logic_vector (15 downto 0);
           led : out std_logic_vector(6 downto 0));
end main;

architecture Behavioral of main is
    component dec is
         Port (input : in std_logic_vector(3 downto 0);
               out1 : out std_logic_vector(6 downto 0));
    end component;
    
    signal led1 : std_logic_vector(6 downto 0);
    signal led2 : std_logic_vector(6 downto 0);
    signal led3 : std_logic_vector(6 downto 0);
    signal led4 : std_logic_vector(6 downto 0);
    signal second_enable : std_logic;
    signal refresh_counter : std_logic_vector(19 downto 0);
    signal led_number : std_logic_vector(1 downto 0);
    signal second_counter : std_logic_vector(27 downto 0);
    signal second1,second2,second3,second4 : std_logic_vector(3 downto 0);
    signal second_temp: std_logic_vector(15 downto 0);
begin
    input_out <= sw;
    digit1 : binary2hex port map (input => sw(15 downto 12), out1 => led1);
    digit2 : binary2hex port map (input => sw(11 downto 8), out1 => led2);
    digit3 : binary2hex port map (input => sw(7 downto 4), out1 => led3);
    digit4 : binary2hex port map (input => sw(3 downto 0), out1 => led4);
    
    process(clock)
        begin 
            if(rising_edge(clock)) then
                refresh_counter <= refresh_counter + 1;           
            end if;
    end process;
    led_number <= refresh_counter(19 downto 18);
    
    process(led_number)
    begin
        case led_number is
        when "00" =>
            anode <= "0111";
            led <= led1;
        when "01" =>
            anode <= "1011"; 
            led <= led2;
        when "10" =>
            anode <= "1101"; 
            led <= led3;
        when "11" =>
            anode <= "1110"; 
            led <= led4;   
        end case;
    end process;
end Behavioral;

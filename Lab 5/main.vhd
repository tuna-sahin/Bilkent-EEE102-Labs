library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
  Port (clk,reset : in std_logic;
        anode : out std_logic_vector(3 downto 0);
        led : out std_logic_vector(15 downto 0);
        val: out std_logic_vector(6 downto 0));
end main;

architecture Behavioral of main is
    component clock is
        Port (clk,reset: in std_logic;
              anode : out std_logic_vector(3 downto 0));
    end component;
        
    component counter is
         Port (seconds_out : out std_logic_vector(15 downto 0);
               clk,reset : in std_logic);
    end component;
    
    component binary2cathode is
         Port (in1 : in std_logic_vector(3 downto 0);
               out1: out std_logic_vector(6 downto 0));
    end component;
    
    signal seconds : std_logic_vector(15 downto 0);
    signal led1,led2,led3,led4 : std_logic_vector(6 downto 0);
    signal anode_t : std_logic_vector(3 downto 0);
begin
    clock1 : clock port map     (clk => clk, reset => reset, anode => anode_t);
    counter1 : counter port map (clk => clk, reset => reset, seconds_out => seconds);
    b2c1 : binary2cathode port map(in1 => seconds(15 downto 12),out1 => led1);
    b2c2 : binary2cathode port map(in1 => seconds(11 downto 8),out1 => led2);
    b2c3 : binary2cathode port map(in1 => seconds(7 downto 4),out1 => led3);
    b2c4 : binary2cathode port map(in1 => seconds(3 downto 0),out1 => led4);
    
    process(anode_t)
    begin
        case anode_t is
           when "1110" => val <= led4;
           when "1101" => val <= led3;
           when "1011" => val <= led2;
           when others => val <= led1;
        end case;
    end process;
    anode <= anode_t;
    led <= seconds;
end Behavioral;

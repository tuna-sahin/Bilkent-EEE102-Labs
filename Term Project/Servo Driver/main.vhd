library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
  Port (angle : in std_logic_vector(7 downto 0);
        clk : in std_logic; 
        out1 : out std_logic
        );
end main;

architecture Behavioral of main is
    signal cons : integer;
    signal coef : integer;
    signal length_i : integer;
    signal length_b : std_logic_vector(30 downto 0);   -- 31 bits is more than enough for these signals but for the sake of safety
    signal length_i2 : integer;
    signal length_b2 : std_logic_vector(30 downto 0);  -- 21 bits is probably enough for these but i have not tested it.
    signal counter : std_logic_vector(30 downto 0);    -- according to my calculations it is 21 though.
    signal out_s : std_logic;
    signal last_angle : std_logic_vector(7 downto 0); 
    signal angle_i : integer;
begin
    angle_i <= TO_INTEGER(unsigned(angle));
    coef <= 1000;
    cons <= 55000;
    length_i  <= (angle_i * coef) + cons; 
    length_i2 <= (2000000) - length_i;
    length_b  <= std_logic_vector(to_unsigned(length_i, length_b'length));
    length_b2 <= std_logic_vector(to_unsigned(length_i2, length_b2'length));  
    
    process(clk,last_angle,angle,out_s,counter) begin
        if last_angle = "UUUUUUUU" then
            last_angle <= "11111111";
            
        elsif (last_angle /= angle) then
            counter <= "0000000000000000000000000000000";
            last_angle <= angle;
            out_s <= '1';
            
        elsif rising_edge(clk) then
            last_angle <= last_angle;
            counter <= counter + 1;    
            if out_s = '1' then
                if counter = length_b then
                    counter <= "0000000000000000000000000000000";
                    out_s <= '0';
                else
                    out_s <= '1';
                end if;              
            elsif out_s = '0' then
                if counter = length_b2 then
                    counter <= "0000000000000000000000000000000";
                    out_s <= '1';
                else
                    out_s <= '0';
                end if;
            end if;
        end if;
   end process;
      
   out1 <= out_s;
end Behavioral;

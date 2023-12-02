library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
  Port (angle : in std_logic_vector(7 downto 0);
        clk,start : in std_logic; 
--        out1b,out2b,out3b : out std_logic_vector(30 downto 0);
--        outled : out std_logic;
--        led : out std_logic_vector(14 downto 0);
--        outa, outas : out std_logic_vector(7 downto 0);
        out1 : out std_logic
        
        );
end main;

architecture Behavioral of main is
    signal cons : integer;
    signal coef : integer;
    signal length_i : integer;
    signal length_b : std_logic_vector(30 downto 0); 
    signal length_i2 : integer;
    signal length_b2 : std_logic_vector(30 downto 0);
    signal counter : std_logic_vector(30 downto 0);
    signal out_s,start_s : std_logic;
    signal last_angle,angle_s : std_logic_vector(7 downto 0); 
    signal angle_i : integer;
begin
    angle_i <= TO_INTEGER(unsigned(angle));
    coef <= 1000;
    cons <= 55000;
    length_i  <= (angle_i * coef) + cons; 
    length_i2 <= (2000000) - length_i;
    length_b  <= std_logic_vector(to_unsigned(length_i, length_b'length));
    length_b2 <= std_logic_vector(to_unsigned(length_i2, length_b2'length));
    
--    process(last_angle) begin
--    if last_angle = "UUUUUUUU" then
--        last_angle <= "00000000";
--    elsif (last_angle /= angle) then
--        counter <= "0000000000000000000000000000000";
--        out_s <= '1';
--    else
--        last_angle <= last_angle;
--    end if;
--    end process;
    
    
    process(clk,last_angle,angle,out_s,counter) begin
        if last_angle = "UUUUUUUU" then
            last_angle <= "11111111";
        elsif (last_angle /= angle) then
            counter <= "0000000000000000000000000000000";
            last_angle <= angle;
            out_s <= '1';
            
        elsif rising_edge(clk) then
            last_angle <= last_angle;
            --outled <= '0';
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
   

   
   
   
--   process(angle) begin
--   if temp_angle2 = temp_angle then
--        start_s <= start;
--   else
--        start_s <= '1';
--        temp_angle2 <= temp_angle;
--   end if;
--   end process;
--   temp_angle <= angle;
   
--    outa <= angle;
--    outas <= last_angle;
--    out1 <= out_s;

--    out1b <= counter; 
--    out2b <= length_b;
--    out3b <= length_b2; 
        
--    outled <= out_s;      
    --led <= length_b(15 downto 1);
    
    out1 <= out_s;
end Behavioral;

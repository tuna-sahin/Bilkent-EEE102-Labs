library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

 
entity main is
  Port (x1,x2 : in std_logic_vector(7 downto 0);
        out1  : out std_logic_vector(7 downto 0);
        out2,out3 : out std_logic_vector(3 downto 0);
        start,clk : in std_logic
        );
end main;

architecture Behavioral of main is
    component reg is
         Port (L : in std_logic_vector(7 downto 0);
               out1 : out std_logic;
               out2 : out std_logic_vector(7 downto 0);
               slk,s,clk : in std_logic);
    end component;
    
    component subtractor is
         Port (x,y : in std_logic_vector(7 downto 0);
                out1 : out std_logic_vector(7 downto 0)       
              );
    end component;
    
    signal L1,L2,L3 : std_logic_vector(7 downto 0);
    signal slk1,slk2,slk3 : std_logic;
    signal clk1,clk2,clk3 : std_logic;
    signal d1,d2,d3,d3_in : std_logic;
    signal b1,b2,b3 : std_logic_vector(7 downto 0);
    signal hold1,hold2,hold3 : std_logic;
    signal sub_b : std_logic_vector(7 downto 0);
    signal count,count2 : std_logic_vector(3 downto 0);
    signal sol : std_logic_vector(7 downto 0);
    signal ekz: std_logic;
begin
    reg1 : reg port map (L => L1 , slk => slk1 , clk => clk1 , out1 => d1 , out2 => b1 , s => '0');
    reg2 : reg port map (L => L2 , slk => slk2 , clk => clk2 , out1 => d2 , out2 => b2 , s => '0');
    reg3 : reg port map (L => L3 , slk => slk3 , clk => clk3 , out1 => d3 , out2 => b3 , s => d3_in);
    sub1 : subtractor port map(x => b1, y => b2, out1 => sub_b);
    
    clk1 <= clk and not hold1;
    clk2 <= clk and not hold2;
    clk3 <= clk and not hold3;
    
    process(clk) begin
    if falling_edge(clk) then
        if start = '1' then
            slk1 <= '1';
            slk2 <= '1';
            slk3 <= '1';
            L1 <= x1;
            L2 <= x2;
            count <= "0000";
            count2 <= "0000";
            L3 <= "11111111";
            hold1 <= '0';
            hold2 <= '0';
            hold3 <= '0';
            ekz <= '0';
        else
 
            
            if (b1 = "00000000") and (b2 = "00000000") then
            hold1 <= '1'; hold2 <= '1'; hold3 <= '1';
            slk1  <= '0'; slk2  <= '0'; slk3  <= '0';
            
            case count is 
                when "0000" => out1 <= "00000000";
                when "0001" => out1 <= "0000000" & b3(7); 
                when "0010" => out1 <= "000000" & b3(7 downto 6);
                when "0011" => out1 <= "00000" & b3(7 downto 5);
                when "0100" => out1 <= "0000" & b3(7 downto 4);
                when "0101" => out1 <= "000" & b3(7 downto 3);
                when "0110" => out1 <= "00" & b3(7 downto 2);
                when "0111" => out1 <= "0" & b3(7 downto 1);
                when others => out1 <= b3;
            end case;    
                
            elsif (d1 = '0' and d2 = '0') then
            hold1 <= '0'; hold2 <= '0'; hold3 <= '0';
            slk1  <= '0'; slk2  <= '0'; slk3  <= '0';
            d3_in <= '0';                
            count2 <= count2 + '1';
            count <= count + '1';
                
            elsif (d1 = '0' and d2 = '1') then
            hold1 <= '0'; hold2 <= '1'; hold3 <= '1';
            slk1  <= '0'; slk2  <= '0'; slk3  <= '0';
                                              
            elsif (d1 = '1' and d2 = '0') then
            hold1 <= '1'; hold2 <= '0'; hold3 <= '1';
            slk1  <= '0'; slk2  <= '0'; slk3  <= '0';                        
                
            elsif b1 = b2 then
            hold1 <= '0'; hold2 <= '0'; hold3 <= '0';
            slk1  <= '0'; slk2  <= '0'; slk3  <= '0';
            d3_in <= d1;
            count <= count + '1';      
                
            elsif b1 > b2 then            
            hold1 <= '0'; hold2 <= '1'; hold3 <= '1';
            slk1  <= '1'; slk2  <= '0'; slk3  <= '0';
            L1 <= sub_b;
               
                               
            elsif b1 < b2 then
            hold1 <= '1'; hold2 <= '0'; hold3 <= '1';
            slk1  <= '0'; slk2  <= '1'; slk3  <= '0';
            L2 <= sub_b;      
            
            end if;
        end if;
    end if;
    end process;  
    out3 <= count2;  
    out2 <= count;
end Behavioral;

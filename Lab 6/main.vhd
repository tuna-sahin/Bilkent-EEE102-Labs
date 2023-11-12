library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
 
entity main is
  Port (x1,x2 : in std_logic_vector(7 downto 0);
        out1  : out std_logic_vector(7 downto 0);
        out2  : out std_logic_vector(2 downto 0);
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
    
    signal L1,L2 : std_logic_vector(7 downto 0);
    signal slk1,slk2 : std_logic;
    signal clk1,clk2 : std_logic;
    signal d1,d2 : std_logic;
    signal b1,b2 : std_logic_vector(7 downto 0);
    signal hold1,hold2 : std_logic;
    signal sub_b : std_logic_vector(7 downto 0);
    
    signal k : std_logic_vector(2 downto 0);
    signal etz : std_logic;
    
    signal sol : std_logic_vector(7 downto 0);
begin
    reg1 : reg port map (L => L1 , slk => slk1 , clk => clk1 , out1 => d1 , out2 => b1 , s => '0');
    reg2 : reg port map (L => L2 , slk => slk2 , clk => clk2 , out1 => d2 , out2 => b2 , s => '0');
    sub1 : subtractor port map(x => b1, y => b2, out1 => sub_b);
    
    
    clk1 <= clk and not hold1;
    clk2 <= clk and not hold2;
    
    process(d1,d2,start) begin
        if start = '1' then
            k <= "000" ;
            L1 <= x1;
            L2 <= x2;
            etz <= '0';
            slk1 <= '1';
            slk2 <= '1'; 
            hold1 <= '0';
            hold2 <= '0';
        else
            if (d1 = '0' and d2 = '0' and etz = '0') then
                if rising_edge(clk) then
                    k <= k + "1";
                end if;
                slk1 <= '0';
                slk2 <= '0';
            elsif (d1 = '0' and d2 = '1') then
                hold2 <= '1';
                hold1 <= '0';
                
                etz <= '1';
                
                slk1 <= '0';
                slk2 <= '0';
            elsif (d1 = '1' and d2 = '0') then
                hold1 <= '1';  
                hold2 <= '0';
                
                etz <= '1';
                
                slk1 <= '0';
                slk2 <= '0';
            elsif b1 = b2 then
                hold1 <= '1';
                hold2 <= '1';
                etz <= '1';
                
                slk1 <= '0';
                slk2 <= '0';
                
                out1 <= b1;
                
            elsif b1 > b2 then
                L1 <= sub_b;
                slk1 <= '1';
                slk2 <= '0';
                
                etz <= '1';
                
                hold2 <= '1';
                hold1 <= '0';
            elsif b1 < b2 then
                L2 <= sub_b;
                slk2 <= '1';
                slk1 <= '0';
                
                etz <= '1';
                
                hold1 <= '1';
                hold2 <= '0';   
            end if;
        end if;
   end process;
   out2 <= k;
end Behavioral;

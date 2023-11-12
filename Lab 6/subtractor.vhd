library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor is
  Port (x,y : in std_logic_vector(7 downto 0);
        out1 : out std_logic_vector(7 downto 0)       
         );
end subtractor;

architecture Behavioral of subtractor is
    component FA is
	   port(a, b, c_in : in std_logic;
	        so, c_out : out std_logic);
    end component;
    
    component increment is
          Port (x1: in std_logic_vector(7 downto 0);
               out1 : out std_logic_vector(7 downto 0));
    end component;
    
    signal c : std_logic_vector(8 downto 0);
    signal overflow : std_logic;
    signal s,s1,s2,y2 : std_logic_vector(7 downto 0);
begin
    c(0) <= '1';
    y2 <= not y;
        
    fa1: FA port map (a => x(0), b => y2(0) ,c_in => c(0) , so => s(0), c_out => c(1) );     
    fa2: FA port map (a => x(1), b => y2(1) ,c_in => c(1) , so => s(1), c_out => c(2) );     
    fa3: FA port map (a => x(2), b => y2(2) ,c_in => c(2) , so => s(2), c_out => c(3) );   
    fa4: FA port map (a => x(3), b => y2(3) ,c_in => c(3) , so => s(3), c_out => c(4) );   
    fa5: FA port map (a => x(4), b => y2(4) ,c_in => c(4) , so => s(4), c_out => c(5) );     
    fa6: FA port map (a => x(5), b => y2(5) ,c_in => c(5) , so => s(5), c_out => c(6) );     
    fa7: FA port map (a => x(6), b => y2(6) ,c_in => c(6) , so => s(6), c_out => c(7) );   
    fa8: FA port map (a => x(7), b => y2(7) ,c_in => c(7) , so => s(7), c_out => c(8) );  
    s1 <= not s;
    inc: increment port map (x1 => s1 , out1 => s2);
    
    process(s,s1,s2) 
    begin
        if s(7) = '0' then
            out1 <= s;
        else 
            out1 <= s2;
        end if;
    end process;

end Behavioral;

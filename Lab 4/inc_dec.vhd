library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inc_dec is
      Port (x1 : in std_logic_vector(3 downto 0);
            op : in std_logic;
            s0 : out std_logic_vector(3 downto 0);
            out0 : out std_logic);
end inc_dec;

architecture Behavioral of inc_dec is
    component HA is
        Port (x1,x2 : in  std_logic;
        c , s : out std_logic);
    end component;
    
    component add_sub is
	   port(x1, x2 : in std_logic_vector;
	        op : in std_logic;
	        s : out std_logic_vector(3 downto 0);
	        out1 : out std_logic);
    end component;
    
    signal c,s1,s2 : std_logic_vector(3 downto 0);
    signal out1,out2,out3 : std_logic;
begin
    ha1: HA port map (x1 => x1(0) , x2 => '1' , c => c(0) , s => s1(0)); 
    ha2: HA port map (x1 => x1(1) , x2 => c(0) , c => c(1) , s => s1(1));
    ha3: HA port map (x1 => x1(2) , x2 => c(1) , c => c(2) , s => s1(2)); 
    ha4: HA port map (x1 => x1(3) , x2 => c(2) , c => c(3) , s => s1(3));
    out1 <= c(2) xor c(3);
    
    add_sub1 : add_sub port map (x1 => x1 , x2 => "1111" , op => '0' , s => s2, out1 => out2); -- 1 for sub 0 for add
    out3 <= (not x1(0))  and (not x1(1)) and (not x1(2)) and (x1(3));
    
    
    
    process(s1,s2,out1,out3,op)
    begin
        if op = '1' then
            s0 <= s1;
            out0 <= out1;
        else 
            s0 <= s2;
            out0 <= out3;
        end if;
    end process;
end Behavioral;
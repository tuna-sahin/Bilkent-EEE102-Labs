library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub is
    Port ( x1 : in STD_LOGIC_VECTOR(3 downto 0);
           x2 : in STD_LOGIC_VECTOR(3 downto 0);
           op : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR(3 downto 0);
           out1 : out STD_LOGIC);
end add_sub;

architecture add_sub_arch of add_sub is
    component FA is
	   port(a, b, c_in : in std_logic;
	        so, c_out : out std_logic);
    end component;
    signal c: std_logic_vector(4 downto 0);
    signal x: std_logic_vector(3 downto 0);
    signal y: std_logic_vector(3 downto 0);

begin 
    x <= x1;
    process_addsub : process (x2,y,op)
    begin
        if op = '1' then
            y <= not x2;
        else
            y <= x2;
        end if;
    end process process_addsub; 
    c(0) <= op;
    fa1: FA port map (a => x(0), b => y(0) ,c_in => c(0) , so => s(0), c_out => c(1) );     
    fa2: FA port map (a => x(1), b => y(1) ,c_in => c(1) , so => s(1), c_out => c(2) );     
    fa3: FA port map (a => x(2), b => y(2) ,c_in => c(2) , so => s(2), c_out => c(3) );   
    fa4: FA port map (a => x(3), b => y(3) ,c_in => c(3) , so => s(3), c_out => c(4) );     
    out1 <= c(4) xor c(3); 
end add_sub_arch;

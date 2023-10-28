library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
    Port ( x1 : in STD_LOGIC_VECTOR(3 downto 0);
           x2 : in STD_LOGIC_VECTOR(3 downto 0);
           op : in STD_LOGIC_VECTOR(2 downto 0);
           s0 : out STD_LOGIC_VECTOR(3 downto 0);
           out0 : out STD_LOGIC);
end ALU;

    architecture ALU_Arch of ALU is
    component add_sub is
	   port(x1, x2 : in std_logic_vector;
	        op : in std_logic;
	        s : out std_logic_vector(3 downto 0);
	        out1 : out std_logic);
    end component;
    
    component bitwise is 
        port(x1, x2 : in std_logic_vector;
	        op : in std_logic;
	        s : out std_logic_vector(3 downto 0);
	        out1 : out std_logic);
    end component;
    
    component shift_ops is 
        port(x1 : in std_logic_vector;
	        op : in std_logic;
	        s : out std_logic_vector(3 downto 0);
	        out1 : out std_logic);
    end component;
    
    component inc_dec is 
        port(x1 : in std_logic_vector;
            op : in std_logic;
	        s0 : out std_logic_vector(3 downto 0);
	        out0 : out std_logic);
    end component;
    
    signal s1,s2,s3,s4 : std_logic_vector(3 downto 0);
    signal out1,out2,out3,out4 : std_logic;
    
begin 

    add_sub1 : add_sub port map (x1 => x1 , x2 => x2 , op => op(0) , s => s1, out1 => out1); -- 1 for sub 0 for add
    bitwise1 : bitwise port map (x1 => x1 , x2 => x2 , op => op(0) , s => s2, out1 => out2); -- 1 for xor 0 for xnor
    shift_ops1 : shift_ops port map (x1 => x1 , op => op(0) , s => s3, out1 => out3); -- 1 for left aritmatic 0 for right aritmatic shift
    inc_dec1 : inc_dec port map (x1 => x1 , op => op(0) , s0 => s4, out0 => out4); -- 1 for increment 0 for decrement

    
    process (s1,s2,s3,s4,op)
    begin
        if op(2 downto 1) = "11" then
            s0 <= s1;
            out0 <= out1;
        elsif op(2 downto 1) = "10" then 
            s0 <= s2;
            out0 <= out2;
        elsif op(2 downto 1) = "01" then
            s0 <= s3;
            out0 <= out3;
        else
            s0 <= s4;
            out0 <= out4;
        end if;
    end process;    
    
end ALU_Arch;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_a is
end testbench_a;

architecture Behavioral of testbench_a is
    component ALU is
        Port ( x1 : in STD_LOGIC_VECTOR(3 downto 0);
               x2 : in STD_LOGIC_VECTOR(3 downto 0);
               op : in STD_LOGIC_VECTOR(2 downto 0);
               s0 : out STD_LOGIC_VECTOR(3 downto 0);
               out0 : out STD_LOGIC);
    end component;

     signal in1,in2,s1 : std_logic_vector(3 downto 0);
     signal in3 : std_logic_vector(2 downto 0);
     signal out1: std_logic;
begin
    alu1 : ALU port map(x1 => in1 , x2 => in2 , op => in3 , s0 => s1, out0 => out1);
                          

    process
    begin
    
        in1 <= "0111";   --  7
        in2 <= "0011";   --  3 
        in3 <= "110";      -- add    
        wait for 100ns;
        in1 <= "1000";   -- -8
        in2 <= "1111";   -- -1
        wait for 100ns;
        in1 <= "0111";   --  7
        in2 <= "1110";   -- -2
        wait for 100ns;
        in1 <= "1000";   -- -8
        in2 <= "1111";   --  7
        in3 <= "111";      -- sub
        wait for 100ns;
        in1 <= "0111";   --  7
        in2 <= "1111";   -- -1
        wait for 100ns;
        in1 <= "1000";   -- -8   
        in2 <= "0001";   --  1
        wait for 100ns;
         
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity and_gate_test is
end entity and_gate_test;

architecture Behavioral of and_gate_test is
  signal xx, yy, zz, tt : std_logic;
  signal f : std_logic;
begin
  U1: entity work.and_gate
    port map (
      x => xx,
      y => yy,
      z => zz,
      t => tt,
      out1 => f
    );

  process
  begin
    xx <= '0';
    yy <= '0';
    zz <= '0';
    tt <= '0';
    wait for 10 ns;
    xx <= '1';
    yy <= '0';
    zz <= '0';
    tt <= '0';
    wait for 10 ns;
    xx <= '0';
    yy <= '1';
    zz <= '0';
    tt <= '0';
    wait for 10 ns;
    xx <= '1';
    yy <= '1';
    zz <= '0';
    tt <= '0';
    wait for 10 ns;
    xx <= '0';
    yy <= '0';
    zz <= '1';
    tt <= '0';
    wait for 10 ns;
    xx <= '1';
    yy <= '0';
    zz <= '1';
    tt <= '0';
    wait for 10 ns;
    xx <= '0';
    yy <= '1';
    zz <= '1';
    tt <= '0';
    wait for 10 ns;
    xx <= '1';
    yy <= '1';
    zz <= '1';
    tt <= '0';
    wait for 10 ns;
    xx <= '0';
    yy <= '0';
    zz <= '0';
    tt <= '1';
    wait for 10 ns;
    xx <= '1';
    yy <= '0';
    zz <= '0';
    tt <= '1';
    wait for 10 ns;
    xx <= '0';
    yy <= '1';
    zz <= '0';
    tt <= '1';
    wait for 10 ns;
    xx <= '1';
    yy <= '1';
    zz <= '0';
    tt <= '1';
    wait for 10 ns;
    xx <= '0';
    yy <= '0';
    zz <= '1';
    tt <= '1';
    wait for 10 ns;
    xx <= '1';
    yy <= '0';
    zz <= '1';
    tt <= '1';
    wait for 10 ns;
    xx <= '0';
    yy <= '1';
    zz <= '1';
    tt <= '1';
    wait for 10 ns;
    xx <= '1';
    yy <= '1';
    zz <= '1';
    tt <= '1';
    wait for 10 ns;
    wait;
  end process;
end Behavioral;
library ieee;
use ieee.std_logic_1164 .all ;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- In order for this test bench to work, your .bdf file and the the generated
-- .vhd file from Quartus must be named "Ex7.bdf" and "Ex7.vhd"
-- Also, your inputs must be named 'CLK' and 'D' and your outputs must
-- be named 'Q' and 'Qn'
-------------------------------------------------------------------------------

entity ex7_tb is
end ex7_tb;

architecture test_bench of ex7_tb is

  -- component declaration for the Unit Under Test (UUT)
  component ex7 port ( 
    -- circuit inputs
    CLK   : in std_logic;
    D   : in std_logic;

    -- circuit outputs
    Q : out std_logic;
    Qn : out std_logic);
  end component ;

  -- signals to stimulate UUT inputs
  signal CLK   : std_logic := '0';
  signal D   : std_logic := '0';

  -- signals to read UUT outputs
  signal Q : std_logic := '0';
  signal Qn : std_logic := '0';

  begin
  -- Unit Under Test (UUT ) instance
  UUT: ex7 
  port map( CLK => CLK, 
            D => D, 
            Q => Q,
            Qn => Qn);

  -- stimulus
  CLK <= not CLK after 50 ns;

  stimulus: process
  begin
      D <= '0';
      wait for 125 ns;
      D <= '1';
      wait for 325 ns;
      D <= '0';
  end process;
end;

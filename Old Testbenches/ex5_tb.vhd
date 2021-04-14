library ieee;
use ieee.std_logic_1164 .all ;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- In order for this test bench to work, your .bdf file and the the generated
-- .vhd file from Quartus must be named "Ex5.bdf" and "Ex5.vhd"
-- Also, your inputs must be named 'A', 'B', 'C', and 'D' and your outputs 
-- must be named 'F_SOP' and 'F_POS'
-------------------------------------------------------------------------------

entity ex5_tb is
end ex5_tb;

architecture test_bench of ex5_tb is

  -- component declaration for the Unit Under Test (UUT)
  component ex5 port ( 
    -- circuit inputs
    A : in std_logic;
    B : in std_logic;
    C : in std_logic;
    D : in std_logic;

    -- circuit outputs
    F_SOP : out std_logic;
    F_POS : out std_logic); 
  end component ;

  -- signals to stimulate UUT inputs
  signal A : std_logic := '0';
  signal B : std_logic := '0';
  signal C : std_logic := '0';
  signal D : std_logic := '0';

  -- signals to read UUT outputs
  signal F_SOP : std_logic := '0';
  signal F_POS : std_logic := '0';

  begin
  -- Unit Under Test (UUT ) instance
  UUT: ex5 
  port map( A => A, 
            B => B, 
            C => C,
            D => D, 
            F_SOP => F_SOP,
            F_POS => F_POS);

  -- stimulus
  A <= not A after 400 ns;
  B <= not B after 200 ns;
  C <= not C after 100 ns;
  D <= not D after 50 ns;

end;

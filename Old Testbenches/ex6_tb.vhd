library ieee;
use ieee.std_logic_1164 .all ;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- In order for this test bench to work, your .bdf file and the the generated
-- .vhd file from Quartus must be named "Ex6.bdf" and "Ex6.vhd"
-- Also, your inputs must be named 'A', 'B', and 'Cin' and your outputs 
-- must be named 'Sum', 'Cout'
-------------------------------------------------------------------------------

entity ex6_tb is
end ex6_tb;

architecture test_bench of ex6_tb is

  -- component declaration for the Unit Under Test (UUT)
  component ex6 port ( 
    -- circuit inputs
    A   : in std_logic;
    B   : in std_logic;
    Cin : in std_logic;

    -- circuit outputs
    Sum  : out std_logic;
    Cout : out std_logic); 
  end component ;

  -- signals to stimulate UUT inputs
  signal A   : std_logic := '0';
  signal B   : std_logic := '0';
  signal Cin : std_logic := '0';

  -- signals to read UUT outputs
  signal Sum  : std_logic := '0';
  signal Cout : std_logic := '0';

  begin
  -- Unit Under Test (UUT ) instance
  UUT: ex6 
  port map( A => A, 
            B => B, 
            Cin => Cin,
            Sum => Sum,
            Cout => Cout);

  -- stimulus
  A <= not A after 400 ns;
  B <= not B after 200 ns;
  Cin <= not Cin after 100 ns;

end;
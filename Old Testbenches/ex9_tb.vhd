library ieee;
use ieee.std_logic_1164 .all ;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- In order for this test bench to work, your .bdf file and the the generated
-- .vhd file from Quartus must be named "ex9.bdf" and "ex9.vhd"
-- Also, your inputs must be named 'CLK', 'RST', 'A', 'B', and your output
-- must be named 'Z'
-------------------------------------------------------------------------------

entity ex9_tb is
end ex9_tb;

architecture test_bench of ex9_tb is

  -- component declaration for the Unit Under Test (UUT)
  component ex9 port ( 
    -- circuit inputs
    CLK :   in  std_logic;
    RST :   in  std_logic;
    A :     in  std_logic;
    B :     in  std_logic;
    -- circuit outputs
    Z :    out  std_logic);
  end component ;

  -- signals to stimulate UUT inputs
  signal CLK   : std_logic := '1';
  signal RST   : std_logic; 
  signal A     : std_logic; 
  signal B     : std_logic; 

  -- signals to read UUT outputs
  signal Z : std_logic;

  constant clk_period : time := 100 ns;

  begin
  -- Unit Under Test (UUT ) instance
  UUT: ex9 
  port map( CLK => CLK, 
            RST => RST,
            A   => A,
            B   => B,
            Z   => Z);

  -- stimulus CLK
  CLK <= not CLK after clk_period/2;

  -- stimulus RST
  stimulusRST: process
  begin
      RST <= '1';            -- at  0 ns
      wait for clk_period/4;  
      RST <= '0';            -- at 25 ns
      wait for clk_period/2;  
      RST <= '1';            -- at 75 ns
      wait;
  end process;
	  
  -- stimulus A
  stimulusA: process
  begin
      A <= '1';             -- at  0 ns
      wait for 5*clk_period/4;       
      A <= '1';            -- at 125 ns
      wait for clk_period;
      A <= ____;
      wait for clk_period;
      A <= ____;
      wait for clk_period;
      A <= ____;
      wait for clk_period;
      A <= ____;
      wait for clk_period;
      A <= ____;
      wait for clk_period;
      A <= ____;
      wait for clk_period;
      A <= ____;
      wait;
  end process;

-- stimulus B
  stimulusB: process
  begin
      B <= '1';             -- at  0 ns
      wait for 5*clk_period/4;       
      B <= '0';            -- at 125 ns
      wait for clk_period;
      B <= ____;
      wait for clk_period;
      B <= ____;
      wait for clk_period;
      B <= ____;
      wait for clk_period;
      B <= ____;
      wait for clk_period;
      B <= ____;
      wait for clk_period;
      B <= ____;
      wait for clk_period;
      B <= ____;
      wait;
  end process;
end;

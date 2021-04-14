library ieee;
use ieee.std_logic_1164 .all ;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- In order for this test bench to work, your .bdf file and the the generated
-- .vhd file from Quartus must be named "Ex8.bdf" and "Ex8.vhd"
-- Also, your inputs must be named 'CLK', 'RST', 'SL', 'SIN', 'A', 'B', 'C' 
--  and 'D' and your outputs must be named 'QA', 'QB', 'QC', and 'QD'
-------------------------------------------------------------------------------

entity ex8_tb is
end ex8_tb;

architecture test_bench of ex8_tb is

  -- component declaration for the Unit Under Test (UUT)
  component ex8 port ( 
    -- circuit inputs
    CLK :   in  std_logic;
    SL :    in  std_logic;
    SIN :   in  std_logic;
    RST :   in  std_logic;
    A :     in  std_logic;
    B :     in  std_logic;
    C :     in  std_logic;
    D :     in  std_logic;
    -- circuit outputs
    QA :    out  std_logic;
    QB :    out  std_logic;
    QC :    out  std_logic;
    QD :    out  std_logic);
  end component ;

  -- signals to stimulate UUT inputs
  signal CLK   : std_logic := '1';
  signal SL    : std_logic; 
  signal SIN   : std_logic; 
  signal RST   : std_logic; 
  signal A     : std_logic; 
  signal B     : std_logic; 
  signal C     : std_logic; 
  signal D     : std_logic; 

  -- signals to read UUT outputs
  signal QA : std_logic;
  signal QB : std_logic;
  signal QC : std_logic;
  signal QD : std_logic;

  constant clk_period : time := 100 ns;

  begin
  -- Unit Under Test (UUT ) instance
  UUT: ex8 
  port map( CLK => CLK, 
            SL  => SL,
            SIN => SIN,
            RST => RST,
            A   => A,
            B   => B,
            C   => C,
            D   => D,
            QA  => QA,
            QB  => QB,
            QC  => QC,
            QD  => QD);

  -- stimulus CLK
  CLK <= not CLK after clk_period/2;

  -- stimulus RST
  stimulusRST: process
  begin
      RST <= '1';            -- at  0 ns
      wait for clk_period/4;  
      RST <= '0';            -- at 25 ns
      wait for clk_period/2;  
      RST <= ____;           -- at 75 ns, fill in the new RST value 
      wait;
  end process;
	  
  -- stimulus SL
  stimulusSL: process
  begin
      SL <= '1';             -- at  0 ns
      wait for 125 ns;       
      SL <= ____;            -- at 125 ns, fill in the new SL value  
      wait;
  end process;

-- stimulus SIN
  stimulusSIN: process
  begin
      SIN <= '0';            -- at  0 ns
      wait for 325 ns;       
      SIN <= ____;           -- at 325 ns, fill in the new SIN value  
      wait;
  end process;

-- stimulus A, B, C, D
  
  A <= ____;                 -- fill in A value     
  B <= ____;                 -- fill in B value 
  C <= ____;                 -- fill in C value
  D <= ____;                 -- fill in D value   

  
end;

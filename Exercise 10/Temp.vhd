-- Sam Harris

-- Dataflow Style Half Adder
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port (h_a : in std_logic;
    h_b  : in  std_logic;
    h_s  : out std_logic;
    h_co : out std_logic);
end half_adder;

architecture dataflow of half_adder is
begin
  h_s  <= h_a xor h_b;
  h_co <= h_a and h_b;
end dataflow;

-- Dataflow Stlye Or Gate
library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
  port (or_a : in std_logic;
    or_b : in  std_logic;
    or_x : out std_logic);
end or_gate;

architecture dataflow of or_gate is
begin
  or_x <= or_a or or_b;
end dataflow;

-- Structural Style Full Adder Using Two half_adder's and an or_gate
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port (f_a : in std_logic;
    f_b  : in  std_logic;
    f_ci : in  std_logic;
    f_s  : out std_logic;
    f_co : out std_logic);
end full_adder;

architecture structure of full_adder is

  -- Component Declarations
  component or_gate
    port (or_a : in std_logic;
      or_b : in  std_logic;
      or_x : out std_logic);
  end component;

  component half_adder
    port (h_a : in std_logic;
      h_b  : in  std_logic;
      h_s  : out std_logic;
      h_co : out std_logic);
  end component;


begin
    half_adder_1 : half_adder port map (f_a => h_a, f_b => h_b, h_s => s1, h_co => h_co);
    half_adder_2 : half_adder port map (s1  => h_a, f_ci => h_b, h_s => f_s, h_co => s3);
    -- Need A Way to Specify That h_co Comes From half_adder1
    or_1 : xor_gate port map (s3 => or_a, h_co => or_b, or_x => f_co);

end structure;
-- Dataflow Stlye Or Gate
library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
  port (A   : in std_logic;
		B   : in std_logic;
		Y   : out std_logic);
end or_gate;

architecture dataflow of or_gate is 
  begin
  Y <= A or B; 
end dataflow;
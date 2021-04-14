library ieee;

use ieee.std_logic_1164.all;

entity and4 is
	port(A, B, C, D : in std_logic;
		Y : out std_logic);
end and4;

architecture dataflow of and4 is
begin
	Y <= A and B and C and D after 7ns;
end dataflow;
library ieee;

use ieee.std_logic_1164.all;

entity or4 is
	port(A, B, C, D : in std_logic;
		Y : out std_logic);
end or4;

architecture dataflow of or4 is
begin
	Y <= A or B or C or D after 7ns;
end dataflow;
library ieee;

use ieee.std_logic_1164.all;

entity not1 is
	port(A : in std_logic;
		Y : out std_logic);
end not1;

architecture dataflow of not1 is
begin
	Y <= not A after 4ns;
end dataflow;
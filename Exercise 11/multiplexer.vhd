library ieee;
use ieee.std_logic_1164.all;

-- Constructor
entity Multiplexer4 is
	port(G1, G2, A, B : in std_logic;
		 C1, C2 : in std_logic_vector(3 downto 0);
		 Y1, Y2 : out std_logic);
end Multiplexer4	



architecture dataflow of Multiplexer4 is

 --Control Signals? Aren't Just A & B Control?

begin
sControl1 <= ;

with A select

	-- First Multiplexer
	Y1 <= C1(0) when "000",
		  C1(1) when "001",
		  C1(2) when "010",
		  C1(3) when "100";

with B select
	
	-- Second Multiplexer
	Y2 <= C2(0) when "000",
		  C2(1) when "001",
		  C2(2) when "010",
		  C2(3) when "100";

end dataflow
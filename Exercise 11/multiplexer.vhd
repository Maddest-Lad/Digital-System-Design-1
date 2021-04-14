library ieee;
use ieee.std_logic_1164.all;

-- Constructor
entity Multiplexer4 is
	port(G1, G2, A, B : in std_logic;
		 C1, C2 : in std_logic_vector(3 downto 0);
		 Y1, Y2 : out std_logic);
end Multiplexer4;

-- DataFlow
architecture dataflow of Multiplexer4 is

 -- Signals


begin
sControl1 <= _____;

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

end dataflow;


-- Structure
architecture struct of Multiplexer4 is
	
	-- Component Declarations
	component and4 is
		port(A, B, C, D : in std_logic;
			Y : out std_logic);
	end component;

	component or4 is
		port(A, B, C, D : in std_logic;
			Y : out std_logic);
	end component;

	component not is
		port(A : in std_logic;
			Y : out std_logic);
	end component;

	 --Signals
	 signal and_0, and_1, and_2, and_3, and_4, and_5, and_6l and_7 : std_logic  := '0';
	 signal not_G1, not_G2, not_A, not_B, not_not_A, not_not_B  : std_logic := '0';

begin
	
	-- Various Inverts
	not_1 : not port map (A => G1, Y => not_G1);
	not_2 : not port map (A => G2, Y => not_G2);
	not_3 : not port map (A => A, Y => not_A);
	not_4 : not port map (A => B, Y => not_B);
	not_5 : not port map (A => not_A, Y => not_not_A);
	not_6 : not port map (A => not_B, Y => not_not_B);
	
	-- First Multiplexer
	and4_0 : and4 port map (A => not_G1, B => not_B, C => not_A, D => C1(0), Y=> and_0);
	and4_1 : and4 port map (A => not_G1, B => not_B, C => not_not_A, D => C1(1), Y=> and_1);
	and4_2 : and4 port map (A => not_G1, B => not_not_B, C => not_A, D => C1(2), Y=> and_2);
	and4_3 : and4 port map (A => not_G1, B => not_not_B, C => not_not_A, D => C1(3), Y=> and_3);

	output_Y1 : or4 port map(A => and0, B => and_1, C => and_2, D => and_3, Y => Y1);


	-- Second Multiplexer
	and4_4 : and4 port map ();
	and4_5 : and4 port map ();
	and4_6 : and4 port map ();
	and4_7 : and4 port map ();

	output_Y2 : or4 port map();

end;


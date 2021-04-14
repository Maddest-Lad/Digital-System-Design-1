library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;


architecture behavior of tb is

	component Multiplexer4
		port(
			G1, G2, A, B : in  std_logic;
			C1, C2       : in  std_logic_vector(3 downto 0);
			Y1, Y2       : out std_logic
		);
	end component ;

	-- Signals UUT Input
	signal G1, G2 : std_logic := '0';
	signal A, B
	signal C1, C2 : std_logic_vector(3 downto 0);

	-- Signals UUT Output
	signal Y1, Y2 : std_logic := '0';


	-- Component Binding (ie Pick Which Architecture Version)
	UUT1 : Mux4 use entity work.Mux4(dataflow);
	UUT2 : Mux4 use entity work.Mux4(behavioural);
	UUT3 : Mux4 use entity work.Mux4(struct);

begin
		-- Unit Under Test (UUT) instance
		UUT1 : Mux4 port map (G1 => G1, G2 => G2, A => A, B => B, Y1 => Y1, Y2 => Y2);
		UUT2 : Mux4 port map (G1 => G1, G2 => G2, A => A, B => B, Y1 => Y1, Y2 => Y2);
		UUT3 : Mux4 port map (G1 => G1, G2 => G2, A => A, B => B, Y1 => Y1, Y2 => Y2);

	process

	begin

	end process;


end;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;


architecture behavior of tb is

	component Mux4
		port(
			G1, G2, A, B : in  std_logic;
			C1, C2       : in  std_logic_vector;
			Y1, Y2       : out std_logic);
	end component;

	-- Signals UUT Input
	signal G1, G2 : std_logic := '1';
	signal A, B : std_logic := '0';
	signal C1, C2 : std_logic_vector(3 downto 0) := "0000";

	-- Signals UUT Output
	signal Y1_1, Y2_1, Y1_2, Y2_2, Y1_3, Y2_3 : std_logic := '0';


	-- Component Binding (ie Pick Which Architecture Version)
	for UUT1 : Mux4 use entity work.Mux4(dataflow);
	for UUT2 : Mux4 use entity work.Mux4(behavioural);
	for UUT3 : Mux4 use entity work.Mux4(struct);

begin
		-- Unit Under Test (UUT) instance
		UUT1 : Mux4 port map (G1 => G1, G2 => G2, A => A, B => B, C1 => C1, C2 => C2, Y1 => Y1_1, Y2 => Y2_1);
		UUT2 : Mux4 port map (G1 => G1, G2 => G2, A => A, B => B, C1 => C1, C2 => C2, Y1 => Y1_2, Y2 => Y2_2);
		UUT3 : Mux4 port map (G1 => G1, G2 => G2, A => A, B => B, C1 => C1, C2 => C2, Y1 => Y1_3, Y2 => Y2_3);
	
	A <= not A after 100 ns;
	B <= not B after 200 ns;

	process

	begin
		C1 <= "1010"; C2 <= "1010"; wait for 100 ns;
		C1 <= "1010"; C2 <= "1010"; wait for 100 ns;
		C1 <= "1010"; C2 <= "1010"; wait for 100 ns;
		C1 <= "1010"; C2 <= "1010"; wait for 100 ns;
		C1 <= "0101"; C2 <= "0101"; wait for 100 ns;
		C1 <= "0101"; C2 <= "0101"; wait for 100 ns;
		C1 <= "0101"; C2 <= "0101"; wait for 100 ns;
		C1 <= "0101"; C2 <= "0101"; wait for 100 ns;



	end process;


end;
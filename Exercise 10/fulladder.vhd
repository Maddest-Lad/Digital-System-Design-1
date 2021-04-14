--------------------------------------------------
-- Company      : RIT
-- Author       : MarcinLukowiak
-- Created      : xx:xx:xxxx/xx/xxxx
--
-- Project Name : lab 10
-- File         : fulladder.vhd
--
-- Entity       : fulladder
-- Architecture : df(dataflow)
--
-- Revision
-- Rev0.01      : xx:xx:xxxx/xx/xxxx file created
--
-- Toolversion  : VHDL’93
-- Description  : The following is the entity and
--                behavioral description of a
--                1-bit full adder.
--

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		A    : in  std_logic;  -- A, active high
		B    : in  std_logic;  -- B, active high
		Cin  : in  std_logic;  -- CarryIn, active high
		Sum  : out std_logic;  -- Sum, active high
		Cout : out std_logic); -- CarryOut, active high
end full_adder ;

architecture df of full_adder is
	--internal signal declarations
	signal s1, s2, s3 : std_logic := '0';

begin
	-- use one signal assignment statement to model
	-- 3-input XOR gate that calculates value for the Sum output
	Sum <= A xor B xor Cin;
	-- write three statements to model 2-input AND gates
	-- calculating partial values for Cout output
	s1 <= a and b;
	s2 <= a and Cin;
	s3 <= b and Cin;
	-- use one signal assignment statement to model
	-- 3-input OR gate that calculates the final value for Cout output
	Cout <= s1 or s2 or s3;
end;

architecture struct of full_adder is

	component or3 is
		port(A, B, C : in std_logic;
			Y : out std_logic);
	end component;

	component and2 is
		port(A, B : in std_logic;
			Y : out std_logic);
	end component;

	component xor3 is
		port(A, B, C : in std_logic;
			Y : out std_logic);
	end component;

	signal s_1, s_2, s_3 : std_logic := '0';

begin
		xor3_instance1 : xor3 port map (A => A, B => B, C => Cin, Y => Sum);

		and2_instance1 : and2 port map (A => A, B => B , Y => s_1);
		and2_instance2 : and2 port map (A => A, B => Cin, Y => s_2);
		and2_instance3 : and2 port map (A => Cin, B => B, Y => s_3);

		or3_instance1 : or3 port map (A => s_1, B => s_2, C => s_3, Y => Cout);
end;



architecture haddor of full_adder is

	component or_gate is
		port(A, B : in std_logic;
			Y : out std_logic);
	end component;

	component hadder is
		port (A, B : in std_logic;
			Sum, Cout : out std_logic);
	end component;

	signal s_1, s_2, s_3 : std_logic := '0';

begin

		half_adder_1 : hadder port map (A  => A, B => B, Sum => s_1, Cout => s_2);
		half_adder_2 : hadder port map (A  => s_1, B => Cin, Sum => Sum, Cout => s_3);
		or_1         : or_gate port map (A => s_3, B => s_2, Y => Cout);

end;
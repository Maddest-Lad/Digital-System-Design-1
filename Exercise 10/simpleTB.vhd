library ieee;
use ieee.std_logic_1164.all;

entity tb is

end tb;


architecture behavior of tb is

component full_adder
port (
	A    : in std_logic;
	B    : in std_logic;
	Cin  : in std_logic;
	Sum  : out std_logic;
	Cout : out std_logic);
end component ;

-- Signals UUT Input
signal sA   : std_logic := '0';
signal sB   : std_logic := '0';
signal sCin : std_logic := '0';

-- Signals UUT Output
signal sSum  : std_logic := '0';
signal sCout : std_logic := '0';

-- Component Binding (ie Pick Which Architecture Version)
for UUT1 : full_adder use entity work.full_adder(df);

begin
-- Unit Under Test (UUT) instance
UUT: full_adder port map (A => sA, B => sB, Cin => sCin, Sum => sSum, Cout => sCout);

-- Stimulus
sA   <= not sA   after 50 ns;
sB   <= not sB   after 100 ns;
sCin <= not sCin after 200 ns;
end;

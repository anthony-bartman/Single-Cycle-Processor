library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
port(
		A,B : in std_logic_vector(31 downto 0);
		ALUS : in std_logic_vector(2 downto 0);
		F : inout std_logic_vector(31 downto 0);
		C,V,N,Z : out std_logic
	 );
end entity alu;


architecture Behavioral of alu is

begin

	with ALUS select
		F <=  A + B when "000",
			   A-B when "001",
				A and B when "010",
			   A or B when "011",
			   A xor B when "100",
			   A when "101",
			   B when "110",
			   X"00000001" when "111",
			   X"00000000" when others;

	N <= F(31);
	Z <= '1' when F = X"00000000" else '0';
	C <= '0';
	V <= '0';


end architecture Behavioral;
--Anthony Bartman
--Lab 3
--Dr. Durant
--Summary:
library ieee;
use ieee.std_logic_1164.all;

entity bmux16to1 is
port(
		S: in std_logic_vector(3 downto 0);
		D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15 :
		in std_logic_vector(31 downto 0);
		Y: out std_logic_vector(31 downto 0)
	 );
end entity bmux16to1;


architecture Structural of bmux16to1 is

begin

	with S select
	 Y <= D0 when "0000",
			D1 when "0001",
			D2 when "0010",
			D3 when "0011",
			D4 when "0100",
			D5 when "0101",
			D6 when "0110",
			D7 when "0111",
			D8 when "1000",
			D9 when "1001",
			D10 when "1010",
			D11 when "1011",
			D12 when "1100",
			D13 when "1101",
			D14 when "1110",
			D15 when "1111",
			x"00000000" when others;
			
			

end architecture Structural;
--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This program outputs the constant number 4
library ieee;
use ieee.std_logic_1164.all;

--Y: output to the 4
entity constant4 is
port(
		Y : out std_logic_vector(31 downto 0)
	 );
end entity constant4;

--This the Dataflow architecture of a constant#4.
--This will only output the number 4.
architecture DATAFLOW of constant4 is

begin

	Y <= x"00000004";

end architecture DATAFLOW;
--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This program outputs the constant number 14
library ieee;
use ieee.std_logic_1164.all;

--Y: output to the 14
entity constant14 is
port(
		Y : out std_logic_vector(3 downto 0)
	 );
end entity constant14;

--This the Dataflow architecture of a constant#14.
--This will only output the number 14.
architecture DATAFLOW of constant14 is

begin

	Y <= x"E";

end architecture DATAFLOW;
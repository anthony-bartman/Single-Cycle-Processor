--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This program will create a function that outputs 8 for the counter
library ieee;
use ieee.std_logic_1164.all;

--Y: Output of the program, it will output 8
entity constant8 is
port(
		Y : out std_logic_vector(31 downto 0)
	 );
end entity constant8;

--This is the dataflow of architecture for the constant 8 circuit 
architecture DATAFLOW of constant8 is

begin

	Y <= x"00000008";

end architecture DATAFLOW;
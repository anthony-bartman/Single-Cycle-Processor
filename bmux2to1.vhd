--Anthony Bartman
--Lab 6
--Dr. Durant
--Summary:
--This is a simple 2 to 1 bus mux that is used to 
--select which output from the decoder to use.
library ieee;
use ieee.std_logic_1164.all;

--D0,D1 : Input of the bus mux 2to1
--S: selects which input to use
--Y: output of bus mux
entity bmux2to1 is
port(

		D0,D1 : in std_logic_vector(31 downto 0);
		S : in std_logic;
		Y : out std_logic_vector(31 downto 0)
	 );
end entity bmux2to1;

--This dataflow architecture will determine how the bus 
--mux is implemented.
architecture DATAFLOW of bmux2to1 is

begin

	with S select
		Y <= D0 when '0',
			  D1 when '1',
			  x"00000000" when others;

end architecture DATAFLOW;
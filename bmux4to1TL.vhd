--Anthony Bartman
--Lab 5
--Dr. Durant
--Summary:
--This is a simple 4 to 1 bus mux that is used to 
--select which output from the decoder to use.
library ieee;
use ieee.std_logic_1164.all;

--D0,D1,D2,D3 : Input of the bus mux 4to1
--S: selects which input to use
--Y: output of bus mux
entity bmux4to1TL is
port(

		D0,D1,D2,D3 : in std_logic_vector(31 downto 0);
		S : in std_logic_vector(1 downto 0);
		Y : out std_logic_vector(31 downto 0)
	 );
end entity bmux4to1TL;

--This dataflow architecture will determine how the bus 
--mux is implemented.
architecture DATAFLOW of bmux4to1TL is

begin

	with S select
		Y <= D0 when "00",
			  D1 when "01",
			  D2 when "10",
			  D3 when others;

end architecture DATAFLOW;
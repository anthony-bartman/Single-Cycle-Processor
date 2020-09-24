--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This is a simple 2to1 bus mux to choose a register or
--an immediate.
library ieee;
use ieee.std_logic_1164.all;

--D0,D1 : These inputs hold the register or the immediate
--from the instruction.
--S : select signal to determine which input to take.
--Y : output of bus mux
entity regsrcbmux is
port(
		D0,D1 : in std_logic_vector(3 downto 0);
		S : in std_logic;
		Y : out std_logic_vector(3 downto 0)
	 );
end entity regsrcbmux;

--This Dataflow architecture will implement how the bus mux
--will function 
architecture DATAFLOW OF regsrcbmux is

begin 

	with S select
		Y <= D0 when '0',
			  D1 when '1',
			  "0000" when others;

end architecture DATAFLOW;
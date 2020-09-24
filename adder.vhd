--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This program will add two inputs together
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--A,B :  Inputs of the adder
--S : Output/Result of the adder 
entity adder is
port(
		A,B : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0)
	 );
end entity adder;

--This will dataflow architecture add two numbers together
architecture DATAFLOW of adder is 

begin

	S <= (A + B);
	
end architecture DATAFLOW;
--Anthony Bartman
--Lab 6
--Dr. Durant
--Summary:
--This determines which parts of the scp will be enabled
library ieee;
use ieee.std_logic_1164.all;

--ADDR: is the data being written into reg files
--MEMRD: is enabled when a load instruction is present
--MEMWR: is enabled if data is written to memory
entity addressDecoder is
port(
		ADDR : in std_logic_vector(31 downto 0);
		MEMRD, MEMWR : in std_logic;
		LD2,LD1,LD0,DATAS : out std_logic
	 );
end entity addressDecoder;

--This is the dataflow architecture for the addressDecoder.
--This will select whether the seg7 display is enabled, LED
--is enabled, the data input is enabled, or if the dmem is 
--being written to.
architecture DATAFLOW of addressDecoder is

begin

	 LD2 <= '1' when (MEMRD = '0' and MEMWR = '1' and ADDR < X"00000020")
	 else '0';
	 
	 LD1 <= '1' when (MEMRD = '0' and MEMWR = '1' and ADDR(7 downto 0) = X"F8")
	 else '0';
	 
	 LD0 <= '1' when (MEMRD = '0' and MEMWR = '1' and ADDR(7 downto 0) = X"FC")
	 else '0';
	 
	 DATAS <= '0' when (MEMRD = '1' and MEMWR = '0' and ADDR(7 downto 0) = X"F4") 
	 else '1' when (MEMRD = '1' and MEMWR = '0' and ADDR < X"00000020") 
	 else '-';
	 
end architecture DATAFLOW;
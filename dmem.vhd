--*********************************************************
--* FILENAME dmem.vhd
--* AUTHOR:  meier@msoe.edu <Dr. M.>
--* UPDATER: durant@msoe.edu <Dr. D.>
--* DATE:    MSOE Spring 2016
--* UPDATED: 2018-04-20
--* PROVIDES:
--* - a partial RAM memory of 32-bit words
--* - active-high memwr control signal
--* - falling-edge triggered sample
--* - one read port
--* - one write port
--* NOTE: A smaller memory will simulate much faster
--* ASSUMES: address is multiple of 4 (word-aligned),
--*   2 LSBs of address are ignored
--*********************************************************

--*********************************************************
--* LOAD IEEE LIBRARY AND SPECIFY LIBRARY PACKAGES
--* - std_logic_1164: provides 9-valued standard logic type
--* - std_logic_1164: provides rising and falling edge 
--* - std_logic_unsigned: conv_integer function
--*********************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--*********************************************************
--* ENTITY DECLARATION
--* INPUT PORTS
--* - A: index into memory
--* - WD: 32-bit wide data to be written into memory 
--* - MEMWR: active-high write control signal
--* - CLK: memory samples on falling-edge
--* 
--* OUTPUT PORTS
--* - RD: memory output data
--*********************************************************
entity dmem is
generic (ABITS: integer := 6);
port(A: in std_logic_vector(31 downto 0);
     WD: in std_logic_vector(31 downto 0);
	  MEMWR, RST, CLK: in std_logic;
	  RD: out std_logic_vector(31 downto 0));
end entity dmem;

--*********************************************************
--* ARCHITECTURAL DESCRIPTION
--* - MEMARRAYTYPE: an abstract collection of 32-bit words
--* - MEMARRAY: an instance of MEMARRAYTYPE
--*********************************************************
architecture behavioral of dmem is
  type MEMARRAYTYPE is array(2**(ABITS-2)-1 downto 0)
       of std_logic_vector(31 downto 0);
  signal MEMARRAY: MEMARRAYTYPE;
  signal WORDADDRESS: integer range 2**(ABITS-2)-1 downto 0;
  
begin
  -- In this reduced memory, addresses alias due to ignored bits.
  -- So, if ABITS = 10, 0x4BC is invalid since it has an 11th bit set.
  -- So, addresses 0xBC, 0x4BC, 0x8BC, 0xCBC will actually use the same location.
  WORDADDRESS <= to_integer(unsigned(A(ABITS-1 downto 2)));
  -- asynchronous read: does not depend on clock edge
  RD <= MEMARRAY(WORDADDRESS);
  
  -- synchronous write update process
  -- simulating large memory that does not have reset
  UPDATE: process(CLK,RST,MEMWR)
  begin
	 if falling_edge(CLK) then
	   -- Disabled reset logic follows. Although this works in Quartus 16,
		-- it prevents the synthesizer from realizing this is a RAM.
		--if RST='1' then
			--MEMARRAY <= (others => (others => '0'));
			--for AA in WORDADDRESS'range loop
			--	MEMARRAY(AA) <= (others => '0');
			--end loop;
	   --els
		if MEMWR = '1' then 
			MEMARRAY(WORDADDRESS) <= WD;
		end if;
    end if;
  end process;
  
end architecture behavioral;

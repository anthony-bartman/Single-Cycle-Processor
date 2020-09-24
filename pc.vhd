--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This is the program counter for the entire processor.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--D : Input for the Counter
--LD : Enable for the program counter
--RST : Resets program counter to 0 if enabled
--CLK : Clock for the program counter
--Q : Output of counter, determines where the assembly
--code will branch to or where code goes in program
entity pc is
port(
		D : in std_logic_vector(31 downto 0);
		LD, RST, CLK : in std_logic;
		Q : out std_logic_vector(31 downto 0)
	 );
end entity pc;
	
--This is the behavorial architecture of the program counter.
--If the active-high reset is enabled, program counter will be
--reset to 0. If enable is active, the program counter will count
--up by either 4 or 8.
architecture BEHAVIORAL of pc is

begin
  
  clock:process(CLK,LD,RST)
	begin
		if(RST = '0') then
			Q<=x"00000000";
		elsif(falling_edge(clk)) then
			if(LD = '1') then
				Q <= D;
			end if;
		end if;
	end process;	
end architecture BEHAVIORAL;
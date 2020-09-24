--Anthony Bartman
--Lab 3
--Dr. Durant
--Summary:
--This class creates a simple 32 bit register that will be used as a component 
--in the register file.

library ieee;
use ieee.std_logic_1164.all;

--D: input that stores values 
--LD: Enables the register to function
--RST: asynchronous reset will reset register to 0
--CLK: clock signal
--Q: outputs the stored value from D

entity reg32 is
port(
		LD,RST,CLK : in std_logic;
		D : in std_logic_vector(31 downto 0);
		Q : out std_logic_vector(31 downto 0)
	 );
end entity reg32;

--This Behavioral architecture determines how to reg32 will function.
--There is an asynchronous active-high reset that will set the register's 
--output to 0 if reset is on. If reset is off and there is a falling edge
--of the clock, the inputted D value wil be set to output Q value.
architecture Behavioral of reg32 is

	signal QState : std_logic_vector(31 downto 0);

begin

	clock:process(CLK,RST)
	begin
		if(RST = '1') then
			QState<="00000000000000000000000000000000";
		elsif(falling_edge(clk)) then
			if(LD = '1') then
				QState <= D;
			end if;
		end if;
	end process;
	
	Q <= QState;	
		
end architecture Behavioral; 
--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This is the register that stores the flagged bits from the ALU.
library ieee;
use ieee.std_logic_1164.all;

--D0,D1,D2,D3 : Inputs for the register(C,V,N,Z)
--LD : Will determine if register can be written to
--RST : Resets the values in the register
--CLK : Clock of processor
--Q0,Q1,Q2,Q3 : Outputs of the register(C,V,N,Z)
entity reg4 is
port(

		D0,D1,D2,D3 : in std_logic;
		LD, RST,CLK : in std_logic;
		Q0,Q1,Q2,Q3 : out std_logic
	 );
end entity reg4;

--This will create the dataflow architecutre for the register.
--If active-high reset is enabled, the C,V,N,Z will be reset to 0.
--If load is enabled, the register file will store the C,V,N,Z values
--from the alu.
architecture DATAFLOW of reg4 is

begin

	clock:process(CLK,RST)
	begin
		if(RST = '0') then
			Q0 <='0';
			Q1 <='0';
			Q2 <='0';
			Q3 <='0';
		elsif(falling_edge(clk)) then
			if(LD = '1') then
				Q0 <=D0;
				Q1 <=D1;
				Q2 <=D2;
				Q3 <=D3;	
			end if;
		end if;
	end process;

end architecture DATAFLOW;
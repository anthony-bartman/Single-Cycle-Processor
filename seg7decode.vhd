--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This program will output hexadecimal characters onto the 6 
--seven segment displays on the DE-10 board
library ieee;
use ieee.std_logic_1164.all;

--A : Data_out signal from scp
--SegN: This determines what segments to turn on or off based on
--what the data_out signal is
entity seg7decode is
port(
		A : in std_logic_vector(31 downto 0);
		seg5,seg4,seg3,seg2,seg1,seg0 : out std_logic_vector(7 downto 0)
	 );
end entity seg7decode;

--This dataflow architecture will explain what each 7-segment display will
--do based on the input signal A. 
architecture DATAFLOW of seg7decode is

begin

	with A(23 downto 20) select
		seg5 <= "11000000" when X"0",
				  "11111001" when X"1",
				  "10100100" when X"2",
				  "10110000" when X"3",
				  "10011001" when X"4",
				  "10010010" when X"5",
				  "10000010" when X"6",
				  "11111000" when X"7",
				  "10000000" when X"8",
				  "10010000" when X"9",
				  "10001000" when X"A",
				  "10000011" when X"B",
				  "10100111" when X"C",
				  "10100001" when X"D",
				  "10000110" when X"E",
				  "10001110" when X"F",
				  "11111111" when others;
				  
	
	with A(19 downto 16) select
		seg4 <= "11000000" when X"0",
				  "11111001" when X"1",
				  "10100100" when X"2",
				  "10110000" when X"3",
				  "10011001" when X"4",
				  "10010010" when X"5",
				  "10000010" when X"6",
				  "11111000" when X"7",
				  "10000000" when X"8",
				  "10010000" when X"9",
				  "10001000" when X"A",
				  "10000011" when X"B",
				  "10100111" when X"C",
				  "10100001" when X"D",
				  "10000110" when X"E",
				  "10001110" when X"F",
				  "11111111" when others;
		
	with A(15 downto 12) select
		seg3 <= "11000000" when X"0",
				  "11111001" when X"1",
				  "10100100" when X"2",
				  "10110000" when X"3",
				  "10011001" when X"4",
				  "10010010" when X"5",
				  "10000010" when X"6",
				  "11111000" when X"7",
				  "10000000" when X"8",
				  "10010000" when X"9",
				  "10001000" when X"A",
				  "10000011" when X"B",
				  "10100111" when X"C",
				  "10100001" when X"D",
				  "10000110" when X"E",
				  "10001110" when X"F",
				  "11111111" when others;
		
	with A(11 downto 8) select
		seg2 <= "11000000" when X"0",
				  "11111001" when X"1",
				  "10100100" when X"2",
				  "10110000" when X"3",
				  "10011001" when X"4",
				  "10010010" when X"5",
				  "10000010" when X"6",
				  "11111000" when X"7",
				  "10000000" when X"8",
				  "10010000" when X"9",
				  "10001000" when X"A",
				  "10000011" when X"B",
				  "10100111" when X"C",
				  "10100001" when X"D",
				  "10000110" when X"E",
				  "10001110" when X"F",
				  "11111111" when others;
		
	with A(7 downto 4) select
		seg1 <= "11000000" when X"0",
				  "11111001" when X"1",
				  "10100100" when X"2",
				  "10110000" when X"3",
				  "10011001" when X"4",
				  "10010010" when X"5",
				  "10000010" when X"6",
				  "11111000" when X"7",
				  "10000000" when X"8",
				  "10010000" when X"9",
				  "10001000" when X"A",
				  "10000011" when X"B",
				  "10100111" when X"C",
				  "10100001" when X"D",
				  "10000110" when X"E",
				  "10001110" when X"F",
				  "11111111" when others;
		
	with A(3 downto 0) select
		seg0 <= "11000000" when X"0",
				  "11111001" when X"1",
				  "10100100" when X"2",
				  "10110000" when X"3",
				  "10011001" when X"4",
				  "10010010" when X"5",
				  "10000010" when X"6",
				  "11111000" when X"7",
				  "10000000" when X"8",
				  "10010000" when X"9",
				  "10001000" when X"A",
				  "10000011" when X"B",
				  "10100111" when X"C",
				  "10100001" when X"D",
				  "10000110" when X"E",
				  "10001110" when X"F",
				  "11111111" when others;

end architecture DATAFLOW;
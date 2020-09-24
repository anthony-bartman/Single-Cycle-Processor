--Anthony Bartman
--Lab 3
--Dr. Durant
--Summary:
library ieee;
use ieee.std_logic_1164.all;

entity decode4to16 is
port(
		EN : in std_logic;
		ADDR : in std_logic_vector(3 downto 0);
		Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15 :
		out std_logic
	 );
end entity decode4to16;


architecture Dataflow of decode4to16 is



begin

	Y0 <= (EN and not(ADDR(3)) and not(ADDR(2)) and not(ADDR(1)) and not(ADDR(0)));  -- 1 0 0 0 0
	Y1 <= (EN and not(ADDR(3)) and not(ADDR(2)) and not(ADDR(1)) and (ADDR(0)));
	Y2 <= (EN and not(ADDR(3)) and not(ADDR(2)) and (ADDR(1)) and not(ADDR(0)));
	Y3 <= (EN and not(ADDR(3)) and not(ADDR(2)) and (ADDR(1)) and (ADDR(0)));
	Y4 <= (EN and not(ADDR(3)) and (ADDR(2)) and not(ADDR(1)) and not(ADDR(0)));
	Y5 <= (EN and not(ADDR(3)) and (ADDR(2)) and not(ADDR(1)) and (ADDR(0)));
	Y6 <= (EN and not(ADDR(3)) and (ADDR(2)) and (ADDR(1)) and not(ADDR(0)));
	Y7 <= (EN and not(ADDR(3)) and (ADDR(2)) and (ADDR(1)) and (ADDR(0)));
	Y8 <= (EN and (ADDR(3)) and not(ADDR(2)) and not(ADDR(1)) and not(ADDR(0)));
	Y9 <= (EN and (ADDR(3)) and not(ADDR(2)) and not(ADDR(1)) and (ADDR(0)));
	Y10 <= (EN and (ADDR(3)) and not(ADDR(2)) and (ADDR(1)) and not(ADDR(0)));
	Y11 <= (EN and (ADDR(3)) and not(ADDR(2)) and (ADDR(1)) and (ADDR(0)));
	Y12 <= (EN and (ADDR(3)) and (ADDR(2)) and not(ADDR(1)) and not(ADDR(0)));
	Y13 <= (EN and (ADDR(3)) and (ADDR(2)) and not(ADDR(1)) and (ADDR(0)));
	Y14 <= (EN and (ADDR(3)) and (ADDR(2)) and (ADDR(1)) and not(ADDR(0)));
	Y15 <= (EN and (ADDR(3)) and (ADDR(2)) and (ADDR(1)) and (ADDR(0)));
	

end architecture Dataflow;
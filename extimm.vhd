library ieee;
use ieee.std_logic_1164.all;

entity extimm is
port(
		imm : in std_logic_vector(23 downto 0);
		exts : in std_logic_vector(1 downto 0);
		imm32 : out std_logic_vector(31 downto 0)
	 );
end entity extimm;

architecture Behavioral of extimm is


begin 

	imm32 <= X"000000"&imm(7 downto 0) when exts = B"00"
	else 
	X"00000"&imm(11 downto 0) when exts = B"01"
	else
	"000000"&imm(23 downto 0)&B"00" when exts = B"10";

end architecture Behavioral;
library ieee;
use ieee.std_logic_1164.all;

entity reg10 is 
port(D: in std_logic_vector(9 downto 0);
     LD: in std_logic;
	  RST: in std_logic;
	  CLK: in std_logic;
	  Q: out std_logic_vector(31 downto 0));
end entity reg10;

architecture behavioral of reg10 is
begin

	reg: process(RST,LD, CLK)
	begin 
		if RST = '0' then Q <= X"00000000";
	   elsif rising_edge(clk) then 
	     if LD='1' then 
		    Q(31 downto 10) <= (others => '0');
			 Q(9 downto 0) <= D;
		  end if;
		end if;
	end process reg;
	
end architecture behavioral;

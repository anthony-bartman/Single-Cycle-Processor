--Anthony Bartman
--Lab 4
--Dr. Durant
--Summary:
--This class creates the controller for the single cycle processor. It will
--control how the entire processor will execute and decode 32 bits of data by 
--selecting different multiplexers and enable certain signals to attain the end
--goal.

library ieee;
use ieee.std_logic_1164.all;

--COND: Determines type of condition like equals, not equals, or always
--OP: determines if instruction is data processing immediate or from a register
--or load and storing data to from a register or an immediate to memory
--FUNCT: Determines if instruction uses an immediate, which type of instruction,
--and if the instruction will update the C,V,N,Z
--C,V,N,Z: The flagged bits, only implemented the negative and zero bits 
--EXTS: extension select signal that will select different ways of formatting 
--immediates
--ALUS: Select signal that will determine which ALU mathmatical operation to
--perform.
--ALUSRCB: This select signal will select whether the SRC of the instruction is
--an immediate or a register
--ALUFLAGWR: This signal will set the C,V,N, or Z flags if this signal is on
--MEMWR: This signal will determine if the instruction will put the value into
--the memory of the computer rather than a register
--REGSRC: This signal will grab the data from memory and load it into a register
--if enabled
--MULTS: This signals selects the correct 4 bit values to send to the execute stage
--FOURBIT: This 1 bit signal tells the processor if the operation is a multiply instr
--PC4STR: This select signal will determine when to store an address into the LR
--STR14: This select signal will determine when to use different bits based on a mult
--instruction, a branch and link instruction, and any other instruction's rd
--MEMRD: enabled when executing a load instruction
entity controller is
port(
		COND: in std_logic_vector(3 downto 0);
		OP: in std_logic_vector(1 downto 0);
		FUNCT: in std_logic_vector(5 downto 0);
		C,V,N,Z : in std_logic;
		FOURBIT : in std_logic_vector(3 downto 0);
		
		PC4STR : out std_logic;
		STR14: out std_logic_vector(1 downto 0);
		MULTS : out std_logic;
		
		PCSRC,PCWR,REGDST,REGWR: out std_logic;
		EXTS,REGSRC: out std_logic_vector(1 downto 0);
		ALUS: out std_logic_vector(2 downto 0);
		ALUSRCB,ALUFLAGWR,MEMWR,MEMRD: out std_logic
	 );
end entity controller;

--This is the Dataflow architecture of the controller. All 10 outputs are used
--and computed with when else statements and commented to tell the programmer 
--which is used for each instruction. 
architecture DATAFLOW of controller is

begin	

	PCSRC <= '0' when (OP = "10" and COND ="1110") or --branch
				(OP = "10" and COND = "0000" and Z = '1') or --branch equal
				(OP = "10" and COND = "0001" and Z = '0') or  -- branch not equal
				(OP = "10" and COND = "1110") --branch link, branches to label
	else '1';
	
	PC4STR <= '1' when (OP = "10" and COND = "1110" and FUNCT(5 downto 4) = "11") --branch link, store return address in r14
	else '0';
	
	STR14 <= "00";
	
	PCWR <= '1';
								
	REGDST <= '0' when (COND = "1110" and OP = "01" and FUNCT = "011000")  --str
	else '1';
	
	MULTS <= '0' when (OP = "01" and FUNCT(5 downto 1) = "00000" and FOURBIT = "1001") --mul instr
	else '1';
																		
	REGWR <= '0' when (COND = "1110" and OP = "10" and FUNCT(5 downto 4)="10") or --Branch instr
				(COND = "0001" and OP = "10" and FUNCT(5 downto 4) ="10") or --branch not equal
				(COND = "0000" and OP = "10" and FUNCT(5 downto 4) = "10") or --branch equal
				(COND = "1110" and OP = "01" and FUNCT = "011000") or --Str instruction
				(COND = "1110" and OP = "00" and FUNCT = "010101") or -- CMP reg
				(COND = "1110" and OP = "00" and FUNCT = "110101") --CMP immediate
	else '1';
																							
	ALUSRCB <= '1' when (COND = "1110" and OP = "00" and (FUNCT(5) = '0')) --IBit Check
	else '0';
									
	ALUFLAGWR <= '1' when (OP = "00" and FUNCT = "010101") or -- cmp reg
						(OP = "00" and FUNCT = "110101") or	--cmp immediate
						(OP = "00" and FUNCT(0) = '1') -- S-bit is active
	else '0';
																						--str
	MEMWR <= '1' when (COND = "1110") and (OP = "01") and (FUNCT = "011000")
	else '0';
	
	MEMRD <= '1' when (COND = "1110") and (OP = "01") and (FUNCT = "011001") --ldr
	else '0';
																							--ldr
	REGSRC <= "00" when (COND = "1110") and (OP = "01") and (FUNCT = "011001")
	else "01";
	
	ALUS <= "001" when ((OP = "00") and (FUNCT = ("010101"))) or --CMP reg
						 ((OP = "00") and (FUNCT = ("110101"))) or --CMP immediate
						 ((OP = "00") and (FUNCT(4 downto 1) = ("0010"))) --sub reg
	else "101" when ((OP = "00") and (FUNCT(5 downto 1) = ("00000")) and FOURBIT = "1001")  --MULT instr
	else "010" when ((OP = "00") and (FUNCT(4 downto 1) = ("0000"))) --AND reg
	else "011" when ((OP = "00") and (FUNCT(4 downto 1) = ("1100"))) --ORR reg
	else "100" when ((OP = "00") and (FUNCT(4 downto 1) = ("0001"))) --EOR reg
	else "110" when ((OP = "00") and (FUNCT(4 downto 1) = ("1101"))) --Mov reg
	else "000";
	
	EXTS <=  
   "01" when (COND = "1110" and OP = "01" and FUNCT = ("011001" or "011000")) --LDR and STR
	else "10" when ((COND = "1110" and OP = "10" and FUNCT(5 downto 4) = "10") or--Branch 
		(COND = "0000" and OP = "10" and FUNCT(5 downto 4) = "10") or --Branch Equals
		(COND = "0001" and OP = "10" and FUNCT(5 downto 4) = "10")) or--Branch Not Equals
		(OP = "10" and COND = "1110" and FUNCT(5 downto 4) = "11") --branch link, branches to label
	else "00" when (OP = "00" and FUNCT(5) = '1') -- Ibit Check
	else "11"; -- DONT CARES
	
end architecture DATAFLOW;
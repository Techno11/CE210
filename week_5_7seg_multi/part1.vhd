
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Implements a circuit that can display different 4-letter words on four 7-segment
-- displays. The character selected for each display is chosen by the
-- sequence 00, 01, 10, 11. Using the four characters d,
-- E, 1, 0, the display, such as "dE10", as follows:

-- outputs: LEDR shows the states of the switches
-- HEX3 - HEX0 displays the characters 



ENTITY part1 IS 
	PORT (	SW		: IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		LEDR		: OUT	STD_LOGIC_VECTOR(9 DOWNTO 0);
		HEX3, HEX2, HEX1, HEX0	: OUT	STD_LOGIC_VECTOR(0 TO 6));
END part1;

ARCHITECTURE Structure OF part1 IS

	COMPONENT char_7seg1
		PORT (	C	: 	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			Display	: 	OUT STD_LOGIC_VECTOR(0 TO 6));
	END COMPONENT;
	SIGNAL Ch1, Ch2, Ch3, Ch4:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	
	BEGIN



	LEDR <= SW;
        Ch1 <= SW(1 DOWNTO 0);
	Ch2 <= SW(3 DOWNTO 2);
	Ch3 <= SW(5 DOWNTO 4);
	Ch4 <= SW(7 DOWNTO 6);
	

	-- instantiate char_7seg (C, Display);
	H0: char_7seg1 PORT MAP (Ch1, HEX0);
	H1: char_7seg1 PORT MAP (Ch2, HEX1);
	H2: char_7seg1 PORT MAP (Ch3, HEX2);
	H3: char_7seg1 PORT MAP (Ch4, HEX3);


END Structure;



LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char_7seg1 IS
	PORT (	C	: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		Display	: OUT STD_LOGIC_VECTOR(0 TO 6));
END char_7seg1;


ARCHITECTURE Behavior OF char_7seg1 IS
BEGIN

	-- Hex 0, on for 01 (E) and 11 (0)
   Display(0) <= NOT(C(0)); 
	
	-- Hex 1, on for 00 (d), 10 (1), and 11 (0) 
   Display(1) <= NOT(C(1)) AND C(0);
	
	-- Hex 2, on for 00 (d), 10 (1), and 11 (0) 
   Display(2) <= NOT(C(1)) AND C(0);
	
	-- Hex 3, on for 00 (d), 01 (E), and 11 (0) 
   Display(3) <= NOT(C(0)) AND C(1);
	
	-- Hex 4, on for 00 (d), 01 (E), and 11 (0) 
   Display(4) <= NOT(C(0)) AND C(1);
	
	-- Hex 5, on for 01 (E) and 11 (0) 
   Display(5) <= NOT(C(0));
	
	-- Hex 6, on for 00 (d)
   Display(6) <= C(1);
        
END Behavior;


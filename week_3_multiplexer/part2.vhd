-- Implements four 2-to-1 multiplexers.
-- inputs:	SW3-0 represent the 4-bit input X, and SW7-4 represent Y
-- 		SW9 selects either X or Y to drive the output LEDs
-- outputs: LEDR9-0 show the states of the switches; LEDR3-0 shows the outputs of the multiplexers

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY part2 IS 
	PORT (	SW		: IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
			   LEDR	: OUT	STD_LOGIC_VECTOR(9 DOWNTO 0)  -- red LEDs
			);
END part2;

ARCHITECTURE Structure OF part2 IS
	SIGNAL Sel : STD_LOGIC;
	SIGNAL X, Y, M : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	
   X <= SW(3 DOWNTO 0);
   Y <= SW(7 DOWNTO 4);
   Sel <= SW(9);
	
	
	-- Bit 0
	M(0) <= (NOT (Sel) AND X(0)) OR (Sel AND Y(0));
	
	-- Bit 1
	M(1) <= (NOT (Sel) AND X(1)) OR (Sel AND Y(1));
	
	-- Bit 2
	M(2) <= (NOT (Sel) AND X(2)) OR (Sel AND Y(2));
	
	-- Bit 3
	M(3) <= (NOT (Sel) AND X(3)) OR (Sel AND Y(3));
	
	
	LEDR(3 DOWNTO 0) <= M;

END Structure;
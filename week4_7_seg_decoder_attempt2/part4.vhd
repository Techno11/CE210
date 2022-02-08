-- Implements a circuit that can display characters on a 7-segment display. 
-- inputs:  SW1-0 selects the letter to display. The characters are:
--    SW  1 0  Char
--    ----------------
--        0 0 'd'
--        0 1 'E'
--        1 0 '1'
--        1 1 '0'
-- outputs: LEDR2-0 show the states of the switches
--          HEX0 displays the selected character

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part4 IS 
   PORT ( SW    : IN   STD_LOGIC_VECTOR(1 DOWNTO 0);   -- toggle switches
          LEDR  : OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);   -- red LEDs
          HEX0  : OUT  STD_LOGIC_VECTOR(0 TO 6));      -- 7-seg display
END part4;

ARCHITECTURE Structure OF part4 IS
   SIGNAL C : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
   LEDR(1 DOWNTO 0) <= SW;
   LEDR(9 DOWNTO 2) <= "00000000";

   C <= SW;
   --
   --       0  
   --      ---  
   --     |   |
   --    5|   |1
   --     | 6 |
   --      ---  
   --     |   |
   --    4|   |2
   --     |   |
   --      ---  
   --       3  
	
	-- Hex 0, on for 01 (E) and 11 (0)
   HEX0(0) <= (NOT(C(1)) OR NOT(C(0))) AND (C(1) OR NOT(C(0))); 
	
	-- Hex 1, on for 00 (d), 10 (1), and 11 (0) 
   HEX0(1) <= NOT(C(1)) AND C(0);
	
	-- Hex 2, on for 00 (d), 10 (1), and 11 (0) 
   HEX0(2) <= NOT(C(1)) AND C(0);
	
	-- Hex 3, on for 00 (d), 01 (E), and 11 (0) 
   HEX0(3) <= NOT(C(0)) AND C(1);
	
	-- Hex 4, on for 00 (d), 01 (E), and 11 (0) 
   HEX0(4) <= NOT(C(0)) AND C(1);
	
	-- Hex 5, on for 01 (E) and 11 (0) 
   HEX0(5) <= (NOT(C(0)) AND NOT(C(1))) OR (C(1) AND NOT(C(0)));
	
	-- Hex 6, on for 00 (d)
   HEX0(6) <= C(1);
	

END Structure;
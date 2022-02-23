-- 4-bit ripple-carry adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part1 IS 
   PORT ( SW   : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
          LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END part1;

ARCHITECTURE Structure OF part1 IS
   COMPONENT fa
      PORT ( a, b, ci : IN  STD_LOGIC;
             s, co    : OUT STD_LOGIC);
   END COMPONENT;
   SIGNAL A, B, S : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL C       : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
   A <= SW(7 DOWNTO 4);
   B <= SW(3 DOWNTO 0);
	
	stage0: fa PORT MAP ( sw(8), A(0), B(0), S(0), C(0) ) ;
	stage1: fa PORT MAP ( C(0), A(1), B(1), S(1), C(1) ) ;
	stage2: fa PORT MAP ( C(1), A(2), B(2), S(2), C(2) ) ;
	stage3: fa PORT MAP ( C(2), A(3), B(3), S(3), C(3) ) ;
	
	LEDR(3 DOWNTO 0) <= S(3 DOWNTO 0);
	LEDR(4) <= C(3);

END Structure;
         

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fa IS
   PORT ( a, b, ci : IN  STD_LOGIC;
          s, co    : OUT STD_LOGIC);
END fa;

ARCHITECTURE Structure OF fa IS
   SIGNAL a_xor_b : STD_LOGIC;
BEGIN
   
s <= a XOR b XOR ci ;
co <= (a AND b) OR (ci AND a) OR (ci AND b) ;

END Structure;
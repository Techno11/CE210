LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY mux4to1 IS
	PORT (w0, w1, w2, w3 : IN  STD_LOGIC ;
		   s              : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		   f              : OUT  STD_LOGIC ) ;
END mux4to1 ;

ARCHITECTURE Behavior OF mux4to1 IS	
BEGIN
	WITH s SELECT f <=
		w0 when "00",
		w1 when "01",
		w2 when "10",
		w3 when "11";
		
END Behavior ;

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY wk10_latch IS
	PORT ( D, Clk	: IN	STD_LOGIC;
			Qa, Qb, Qc	: OUT	STD_LOGIC);
END wk10_latch;
 
ARCHITECTURE Behavior OF wk10_latch IS
BEGIN
	PROCESS ( D, Clk )
	BEGIN
		IF Clk = '1' THEN
			Qa <= D;
		END IF;
		
		IF rising_edge(Clk) THEN
			Qb <= D;
		END IF;
		
		IF falling_edge(Clk) THEN
			Qc <= D;
		END IF;
		
	END PROCESS;
END Behavior;

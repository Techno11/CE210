LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY majority3 IS
	PORT( x1, x2, x3 : IN STD_LOGIC;
			f: OUT STD_LOGIC);
END majority3;

ARCHITECTURE majority3_rtl OF majority3 IS
BEGIN
	f <= (x1 AND x2) OR (x1 AND x3) OR (x2 AND x3);
END majority3_rtl;
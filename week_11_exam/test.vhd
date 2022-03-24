ENTITY test IS
PORT ( x1, x2, x3 : IN BIT ; 
f : OUT BIT ) ;
END test;

ARCHITECTURE LogicFunc OF test IS

BEGIN

f <= ((NOT x1) AND x3) OR (x1 AND (NOT x3)) OR (x1 AND (NOT x2));

END LogicFunc ;

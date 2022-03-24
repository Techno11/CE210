LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

ENTITY test3 IS 
   PORT (D, Clock  :  IN  STD_LOGIC ; 
    	      Q  :  OUT  STD_LOGIC ) ; 
END test3 ; 

ARCHITECTURE Behavior OF test3 IS    

BEGIN

   PROCESS
   BEGIN
      WAIT UNTIL Clock' EVENT AND Clock = '1' ;
		Q <= D ; 
   END PROCESS ; 

END Behavior ; 

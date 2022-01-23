LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Simple module that connects the SW switches to the LEDR lights

ENTITY lights IS
      PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
                   LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); -- red LEDs
END lights;

ARCHITECTURE Behavior OF lights IS
BEGIN
      LEDR <= SW;
END Behavior;

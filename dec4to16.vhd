LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec4to16 IS
	PORT(	w : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			En	: IN STD_LOGIC;
			y	: OUT STD_LOGIC_VECTOR(0 TO 15));
END dec4to16;

ARCHITECTURE Structure OF dec4to16 IS
	COMPONENT decode
		PORT(	w : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				En : IN STD_LOGIC;
				y	: OUT STD_LOGIC_VECTOR(0 TO 3));
	END COMPONENT;
	signal m : STD_LOGIC_VECTOR(0 to 3);
BEGIN
	G1: FOR i IN 0 TO 3 GENERATE
		Dec_ri: decode PORT MAP (w(1 DOWNTO 0), m(i), y(4*i TO 4*i+3));
		G2: IF i=3 GENERATE
			Dec_left: decode PORT MAP (w(i DOWNTO i-1), En, m);
		END GENERATE;
	END GENERATE;
END Structure;
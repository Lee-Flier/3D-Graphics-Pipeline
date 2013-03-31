----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:56 07/07/2010 
-- Design Name: 
-- Module Name:    package_utility - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------


Library ieee,work; 
   Use ieee.std_logic_1164.all;
   Use IEEE.Std_Logic_Arith.all;
   Use IEEE.std_logic_TextIO.all;
   --- Use work.package_timing.all;

Library Std;
   Use STD.TextIO.all;

Package package_utility is

FUNCTION convert_string( S: in STRING) RETURN STD_LOGIC_VECTOR;
FUNCTION CONV_INTEGER1(S : STD_LOGIC_VECTOR) RETURN INTEGER;

End; -- package package_utility

Package body package_utility is  


------------------------------------------------------------------------------------------------
--Converts string into std_logic_vector 
------------------------------------------------------------------------------------------------

FUNCTION convert_string(S: in STRING) RETURN STD_LOGIC_VECTOR IS
	VARIABLE result : STD_LOGIC_VECTOR(S'RANGE);
		BEGIN
			FOR i	IN S'RANGE LOOP
				IF 	S(i) = '0' THEN
					result(i) := '0'; 
				ELSIF S(i) = '1' THEN 
					result(i) := '1';
				ELSIF S(i) = 'X' THEN
					result(i) := 'X';
				ELSE
					result(i) := 'Z';
				END IF;
			END LOOP;
		RETURN result;
END convert_string;

------------------------------------------------------------------------------------------------
--Converts std_logic_vector into integer
------------------------------------------------------------------------------------------------

FUNCTION CONV_INTEGER1(S : STD_LOGIC_VECTOR) RETURN INTEGER IS
		VARIABLE result : INTEGER := 0;
		BEGIN
			FOR i IN S'RANGE LOOP
				IF S(i) = '1' THEN
					result := result + (2**i);
				ELSIF S(i) = '0' THEN
					result := result;
				ELSE
					result := 0;
				END IF;
			END LOOP;
			RETURN result;
		END CONV_INTEGER1;	




end package_utility;






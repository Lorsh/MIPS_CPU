LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY not_32bit IS 
PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END not_32bit; 


ARCHITECTURE description OF not_32bit IS
BEGIN
	result <= not input1;
END description;
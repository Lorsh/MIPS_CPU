LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY ror_32bit IS 
PORT(
input1	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END ror_32bit; 


ARCHITECTURE description OF ror_32bit IS
BEGIN
	result(30 downto 0) <= input1(31 downto 1);
	result(31) <= '0';
END description;
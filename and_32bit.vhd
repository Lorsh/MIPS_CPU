LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY and_32bit IS 
PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
input2		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);   
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END and_32bit; 


ARCHITECTURE description OF and_32bit IS
BEGIN
	result <= input1 and input2;
END description;
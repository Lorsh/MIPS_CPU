LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY rol_32bit IS 
PORT(
input1	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END rol_32bit; 


ARCHITECTURE description OF rol_32bit IS
BEGIN
	result(31 downto 1) <= input1(30 downto 0);
	result(0) <= '0';
END description;
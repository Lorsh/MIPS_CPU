LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY parity_check_32bit IS 
PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
result   : OUT STD_LOGIC);  
END parity_check_32bit; 


ARCHITECTURE description OF parity_check_32bit IS
BEGIN
	process(input1)
	begin
	if input1 = "00000000000000000000000000000000" then
		result <= '1';
	else 
		result <= '0';
	end if;
	end process;
END description;
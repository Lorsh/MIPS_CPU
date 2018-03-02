LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY mux_2to1 IS 
PORT(
in0,in1 	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
selector     : IN STD_LOGIC;  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END mux_2to1; 


ARCHITECTURE description OF mux_2to1 IS
BEGIN
	process (in0,in1) 
		BEGIN
			case selector is
				when '0' =>
					result <= in0;
				when 	'1' =>
					result <= in1;
				when others => result <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; --in case some weird input comes in that is not one of the above
				
			end case;
		end process;
END description;
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY mux_3to1 IS 
PORT(
in0,in1,in2	 :IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
selector     : IN STD_LOGIC_VECTOR( 1 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END mux_3to1; 


ARCHITECTURE description OF mux_3to1 IS
BEGIN
	process (in0,in1,in2,selector) 
		BEGIN
			case selector is
				when "00" =>
					result <= in0;
				when 	"01" =>
					result <= in1;
				when "10" =>
					result <= in2;
				when others => result <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; --in case some weird input comes in that is not one of the above
				
			end case;
		end process;
END description;
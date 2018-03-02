LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 

ENTITY 8to1mux IS 
PORT(
a		:IN STD_LOGIC_VECTOR(2 DOWNTO 0);  
b 		: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
selector     : IN STD_LOGIC_VECTOR( 2 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));  
END 8to1mux; 
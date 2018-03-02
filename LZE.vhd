LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 
USE ieee.std_logic_unsigned.ALL; 
--takes in 16 bits of info and creates an output with the first 16 bits equal to 0 and the rest being equal to the input

ENTITY LZE IS 
PORT(
in1      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END LZE; 

ARCHITECTURE description OF LZE IS
BEGIN

result <= "0000000000000000" & in1;

END description;
 


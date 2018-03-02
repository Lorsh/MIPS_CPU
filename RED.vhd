LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 
USE ieee.std_logic_unsigned.ALL; 

--takes i a 32 bit vector and only outputs the lower 8 bits

ENTITY RED IS 
PORT(
in1      : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));  
END RED; 


ARCHITECTURE description OF RED IS
BEGIN

result <= in1(7 downto 0);


END description;
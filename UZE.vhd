LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 
USE ieee.std_logic_unsigned.ALL; 

--takes in 16 bits of info and creates an output with the first 16 bits equal to input and the rest being equal to 0

ENTITY UZE IS 
PORT(
in1      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END UZE; 

ARCHITECTURE description OF UZE IS
BEGIN

result <= in1 & "0000000000000000"; 


END description;
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 
ENTITY FullAdder IS 
PORT(
A,B,Cin : in bit;
Cout,Sum : out bit);
END FullAdder;

ARCHITECTURE description of FullAdder IS

BEGIN
sum <= A xor B xor Cin;
Cout <= (A and B) or (B AND Cin) or (A and Cin);

END description; 
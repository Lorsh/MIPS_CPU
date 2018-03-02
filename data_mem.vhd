LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.numeric_std.ALL; 
ENTITY data_mem IS 
PORT( 
clk 
  : IN STD_LOGIC; 
addr 
  : IN UNSIGNED(7 DOWNTO 0);  
data_in    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
wen 
  : IN STD_LOGIC; 
en 
  : IN STD_LOGIC; 
data_out  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END data_mem; 
ARCHITECTURE Description OF data_mem IS  
TYPE MEM IS ARRAY (255 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL ADDRESS : INTEGER RANGE 0 TO 255;
SIGNAL MEMORY : MEM;
BEGIN 
PROCESS(clk,wen,en,data_in)
	BEGIN
		ADDRESS <= to_integer(addr);
		IF falling_edge(clk) THEN
				IF wen = '0' and en = '1' THEN
					data_out <= MEMORY(ADDRESS);
				elsif wen = '1' and en = '1' THEN
					data_out <= "00000000000000000000000000000000";
					MEMORY(ADDRESS) <= data_in;
				else
					data_out <= "00000000000000000000000000000000";
				END IF;
		END IF;
	END PROCESS;
END Description; 
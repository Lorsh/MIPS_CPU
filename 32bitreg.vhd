LIBRARY ieee;            
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL;            
ENTITY bitreg32 IS 
PORT(  d  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);-- input.  
ld  : IN STD_LOGIC;     -- load/enable.  
clr  : IN STD_LOGIC;     -- async. clear.  
clk  : IN STD_LOGIC; -- clock. 
Q  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); -- output.  
 END  bitreg32;            
ARCHITECTURE description OF bitreg32 IS  
 
 BEGIN            
	process(clk,clr)
		BEGIN	
			if (clr ='1') then
				q<=(31 downto 0 => '0');
			elsif rising_edge(clk) then
				if (ld='1') then
					q<=d;
				end if;
			end if;
		end process;									
 END description;
 
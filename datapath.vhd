LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 
USE ieee.std_logic_unsigned.ALL; 
ENTITY datapath IS 
PORT(
Clk, mClk  : IN STD_LOGIC;   --clock Signal 
--Memory Signals 
WEN, EN :    IN STD_LOGIC; 
-- Register Control Signals (CLR and LD). 
Clr_A , Ld_A :       IN STD_LOGIC; 
Clr_B , Ld_B :  IN STD_LOGIC; 
Clr_C , Ld_C :  IN STD_LOGIC; 
Clr_Z , Ld_Z :  IN STD_LOGIC; 
Clr_PC , Ld_PC :     IN STD_LOGIC; 
Clr_IR , Ld_IR :      IN STD_LOGIC; 
-- Register outputs (Some needed to feed back to control unit. Others pulled out for testing. 
Out_A :       OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
Out_B : 		  OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
Out_C :       OUT STD_LOGIC; 
Out_Z : 		  OUT STD_LOGIC; 
Out_PC :      OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
Out_IR :      OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
-- Special inputs to PC. 
Inc_PC :      IN STD_LOGIC; 
-- Address and Data Bus signals for debugging. 
ADDR_OUT :  OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
DATA_IN  :   IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
DATA_OUT, MEM_OUT, MEM_IN :     OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
MEM_ADDR :       OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
-- Various MUX controls. 
DATA_Mux:   IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
REG_Mux :    IN STD_LOGIC; 
A_MUX, B_MUX :   IN STD_LOGIC; 
IM_MUX1 :    IN STD_LOGIC; 
IM_MUX2 :    IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
-- ALU Operations. 
ALU_Op :     IN STD_LOGIC_VECTOR(2 DOWNTO 0)); 
END datapath; 
--------------------------------------------------------------------------------------------------------------------------- 
ARCHITECTURE description OF datapath IS 
--  Component instantiations   
--  you figure this out 
--  Internal signals 
--  you decide what you need 
component ALU IS 
PORT(
a      : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
b     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
op     : IN STD_LOGIC_VECTOR( 2 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);  
cout   : OUT STD_LOGIC;  
zero   : OUT STD_LOGIC);  
END component; 

component LZE IS 
PORT(
in1      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component;

component UZE IS 
PORT(
in1     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component;


component RED IS 
PORT(
in1      : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));  
END component;

component data_mem IS 
PORT( 
clk : IN STD_LOGIC; 
addr : IN UNSIGNED(7 DOWNTO 0);  
data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
wen : IN STD_LOGIC; 
en : IN STD_LOGIC; 
data_out  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 

component mux_3to1 IS 
PORT(
in0,in1,in2	 :IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
selector     : IN STD_LOGIC_VECTOR( 1 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component;

component mux_2to1 IS 
PORT(
in0,in1 	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
selector     : IN STD_LOGIC;  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 
 
component bitreg32 IS 
PORT(  d  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);-- input.  
ld  : IN STD_LOGIC;     -- load/enable.  
clr  : IN STD_LOGIC;     -- async. clear.  
clk  : IN STD_LOGIC; -- clock. 
Q  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); -- output.  
 END  component; 

component programcounter IS 
PORT( clr  : IN STD_LOGIC;  
clk  : IN STD_LOGIC;  
ld  : IN STD_LOGIC;  
inc  : IN STD_LOGIC;  
d  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
q  : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 


signal alu_out : std_LOGIC_VECTOR (31 downto 0);
signal Amux_out: std_LOGIC_VECTOR (31 downto 0);
signal data_bus : std_LOGIC_VECTOR (31 downto 0);
signal Bmux_out: std_LOGIC_VECTOR (31 downto 0);
signal Immux1_out: std_LOGIC_VECTOR (31 downto 0);
signal Immux2_out: std_LOGIC_VECTOR (31 downto 0);
signal reg_mux_out : std_LOGIC_VECTOR (31 downto 0);
signal reducer_out : std_LOGIC_VECTOR (7 downto 0);
signal reg_1_out : std_LOGIC_VECTOR (31 downto 0);
signal reg_2_out : std_LOGIC_VECTOR (31 downto 0);
signal lze1_out: std_LOGIC_VECTOR (31 downto 0);
signal lze2_out: std_LOGIC_VECTOR (31 downto 0);
signal lze3_out: std_LOGIC_VECTOR (31 downto 0);
signal lze4_out: std_LOGIC_VECTOR (31 downto 0);
signal ir_out: std_LOGIC_VECTOR (31 downto 0);
signal memoryInput : std_LOGIC_VECTOR (31 downto 0);
signal memoryOutput : std_LOGIC_VECTOR (31 downto 0);

-- TODO: PC,top LZE,A_MUX,B_MUX,register A,register B,two bottom LZE,reg mux,UZE,im_mux1,in_mux2,ALU

BEGIN 

DATAMUX : mux_3to1 port map (in0  => data_in,in1 => memoryOutput,in2 => alu_out,selector => data_Mux,result => data_bus);
data_out <= data_bus;
InstructReg : bitreg32 port map (d => data_bus,ld => ld_IR,clr => clr_IR,clk=>clk,q => ir_out);
reducer : RED port map (in1 => ir_out, result => reducer_out);
DataMemory : data_mem port map (clk => clk, addr => reducer_out, data_in => memoryInput,data_out => memoryOutput,en => EN, wen=>WEN);
mem_OUT <= memoryOutput;
LZE2 : LZE port map (in1 => ir_out,result => lze2_out);
 


END description; 
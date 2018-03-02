LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 
ENTITY ALU IS 
PORT(
a      : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
b     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
op     : IN STD_LOGIC_VECTOR( 2 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);  
cout   : OUT STD_LOGIC;  
zero   : OUT STD_LOGIC);  
END ALU; 
ARCHITECTURE description OF ALU IS 

component Adder32 is
PORT(
A,B : in std_logic_vector(31 downto 0);
Ci : in std_logic;
Co : out std_logic;
Sum : out std_logic_vector(31 downto 0));
END component;

component mux_8to1 IS 
PORT(
in0,in1,in2,in3,in4,in5,in6,in7		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
selector     : IN STD_LOGIC_VECTOR( 2 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component;

component mux_2to1 IS 
PORT(
in0,in1 	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
selector     : IN STD_LOGIC;  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 

component not_32bit IS 
PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 

component and_32bit IS 
PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
input2		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 

component or_32bit IS 
 PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
input2		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component;

component ror_32bit IS 
PORT(
input1	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 

component rol_32bit IS 
PORT(
input1	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);  
result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));  
END component; 


component parity_check_32bit IS 
PORT(
input1		:IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
result   : OUT STD_LOGIC);  
END component; 

signal AndResult : std_LOGIC_VECTOR (31 downto 0);
signal OrResult : std_LOGIC_VECTOR (31 downto 0); 
signal RORResult : std_LOGIC_VECTOR (31 downto 0); 
signal ROLResult : std_LOGIC_VECTOR (31 downto 0); 
signal AddResult : std_LOGIC_VECTOR (31 downto 0); 
signal NotBlockResult : std_LOGIC_VECTOR (31 downto 0); 
signal SecondInputToAdderWire : std_LOGIC_VECTOR (31 downto 0); --output of 2 bit mux
signal mux_8bit_output : std_LOGIC_VECTOR (31 downto 0);  -- output of 8 bit mux 
signal NotBlockBeforeOrResult : std_LOGIC_VECTOR (31 downto 0); --this is the wire that connects the result of the OR with the 

begin
-- mux that will take in opcode and select which operation to do
BIGMUX : mux_8to1 port map (in0 => AndResult,in1 => OrResult, in2 => AddResult, in6 => AddResult, in4 => ROLResult, in5 => RORResult, in3 => "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ",in7 => "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ",selector => op, result => mux_8bit_output);

-- 32bit AND circuit
ANDBLOCK : and_32bit port map (input1 => a, input2 => b, result => AndResult );
-- 32bit OR circuit
ORBLOCK : or_32bit port map (input1 => a, input2 => b, result => OrResult );
-- the mux that will select whether we do add or subtract
ADD_SUB_MUX : mux_2to1 port map (in0 => b  , in1 => NotBlockResult, selector => op(2), result => SecondInputToAdderWire);  -- when op code is 0xx, we add; when op code is 1xx we subtract
-- 32bit ADDER circuit
AdderCircuit : Adder32 port map (A => a , B => SecondInputToAdderWire, Ci => op(2),Sum => AddResult ,Co => cout );
-- 32 bit not block that will apply NOT operation on the b  ALU's input signal
NOTBLOCK : not_32bit port map (input1 => b, result => NotBlockResult);

-- 32 bit Logical Shift to the left --
RolBlock : rol_32bit port map (input1 => a, result=> ROLResult);

-- 32 bit Logical Shift to the right --

RorBlock : ror_32bit port map (input1 => a, result=> RORResult);

--Zero parity check for Zero output of ALU
ParityCheck : parity_check_32bit port map (input1 => mux_8bit_output,result=> zero);
 
result <= mux_8bit_output;
END description; 
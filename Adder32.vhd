LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;  
USE ieee.std_logic_arith.ALL;  
USE ieee.std_logic_unsigned.ALL; 
ENTITY Adder32 IS 
PORT(
A,B : in std_logic_vector(31 downto 0);
Ci : in std_logic;
Co : out std_logic;
Sum : out std_logic_vector(31 downto 0));
END Adder32;

ARCHITECTURE description of Adder32 IS

component FullAdder IS 
PORT(
A,B,Cin : in std_logic;
Cout,Sum : out std_logic);
END component;
signal wire0 : std_logic;
signal wire1 : std_logic;
signal wire2 : std_logic;
signal wire3 : std_logic;
signal wire4 : std_logic;
signal wire5 : std_logic;
signal wire6 : std_logic;
signal wire7 : std_logic;
signal wire8 : std_logic;
signal wire9 : std_logic;
signal wire10 : std_logic;
signal wire11 : std_logic;
signal wire12 : std_logic;
signal wire13 : std_logic;
signal wire14 : std_logic;
signal wire15 : std_logic;
signal wire16 : std_logic;
signal wire17 : std_logic;
signal wire18 : std_logic;
signal wire19 : std_logic;
signal wire20 : std_logic;
signal wire21 : std_logic;
signal wire22 : std_logic;
signal wire23 : std_logic;
signal wire24 : std_logic;
signal wire25 : std_logic;
signal wire26 : std_logic;
signal wire27 : std_logic;
signal wire28 : std_logic;
signal wire29 : std_logic;
signal wire30 : std_logic;
signal wire31 : std_logic;
signal wire32 : std_logic;



BEGIN

fa0 : FullAdder port map (A => A(0),B=>B(0), Cin => Ci, Sum =>Sum(0),Cout => wire0);
fa1 : FullAdder port map (A => A(1),B=>B(1), Cin => wire0, Sum =>Sum(1),Cout => wire1);
fa2 : FullAdder port map (A => A(2),B=>B(2), Cin => wire1, Sum =>Sum(2),Cout => wire2);
fa3 : FullAdder port map (A => A(3),B=>B(3), Cin => wire2, Sum =>Sum(3),Cout => wire3);
fa4 : FullAdder port map (A => A(4),B=>B(4), Cin => wire3, Sum =>Sum(4),Cout => wire4);
fa5 : FullAdder port map (A => A(5),B=>B(5), Cin => wire4, Sum =>Sum(5),Cout => wire5);
fa6 : FullAdder port map (A => A(6),B=>B(6), Cin => wire5, Sum =>Sum(6),Cout => wire6);
fa7 : FullAdder port map (A => A(7),B=>B(7), Cin => wire6, Sum =>Sum(7),Cout => wire7);
fa8 : FullAdder port map (A => A(8),B=>B(8), Cin => wire7, Sum =>Sum(8),Cout => wire8);
fa9 : FullAdder port map (A => A(9),B=>B(9), Cin => wire8, Sum =>Sum(9),Cout => wire9);
fa10 : FullAdder port map (A => A(10),B=>B(10), Cin => wire9, Sum =>Sum(10),Cout => wire10);
fa11 : FullAdder port map (A => A(11),B=>B(11), Cin => wire10, Sum =>Sum(11),Cout => wire11);
fa12 : FullAdder port map (A => A(12),B=>B(12), Cin => wire11, Sum =>Sum(12),Cout => wire12);
fa13 : FullAdder port map (A => A(13),B=>B(13), Cin => wire12, Sum =>Sum(13),Cout => wire13);
fa14 : FullAdder port map (A => A(14),B=>B(14), Cin => wire13, Sum =>Sum(14),Cout => wire14);
fa15 : FullAdder port map (A => A(15),B=>B(15), Cin => wire14, Sum =>Sum(15),Cout => wire15);
fa16 : FullAdder port map (A => A(16),B=>B(16), Cin => wire15, Sum =>Sum(16),Cout => wire16);
fa17 : FullAdder port map (A => A(17),B=>B(17), Cin => wire16, Sum =>Sum(17),Cout => wire17);
fa18 : FullAdder port map (A => A(18),B=>B(18), Cin => wire17, Sum =>Sum(18),Cout => wire18);
fa19 : FullAdder port map (A => A(19),B=>B(19), Cin => wire18, Sum =>Sum(19),Cout => wire19);
fa20 : FullAdder port map (A => A(20),B=>B(20), Cin => wire19, Sum =>Sum(20),Cout => wire20);
fa21 : FullAdder port map (A => A(21),B=>B(21), Cin => wire20, Sum =>Sum(21),Cout => wire21);
fa22 : FullAdder port map (A => A(22),B=>B(22), Cin => wire21, Sum =>Sum(22),Cout => wire22);
fa23 : FullAdder port map (A => A(23),B=>B(23), Cin => wire22, Sum =>Sum(23),Cout => wire23);
fa24 : FullAdder port map (A => A(24),B=>B(24), Cin => wire23, Sum =>Sum(24),Cout => wire24);
fa25 : FullAdder port map (A => A(25),B=>B(25), Cin => wire24, Sum =>Sum(25),Cout => wire25);
fa26 : FullAdder port map (A => A(26),B=>B(26), Cin => wire25, Sum =>Sum(26),Cout => wire26);
fa27 : FullAdder port map (A => A(27),B=>B(27), Cin => wire26, Sum =>Sum(27),Cout => wire27);
fa28 : FullAdder port map (A => A(28),B=>B(28), Cin => wire27, Sum =>Sum(28),Cout => wire28);
fa29 : FullAdder port map (A => A(29),B=>B(29), Cin => wire28, Sum =>Sum(29),Cout => wire29);
fa30 : FullAdder port map (A => A(30),B=>B(30), Cin => wire29, Sum =>Sum(30),Cout => wire30);
fa31 : FullAdder port map (A => A(31),B=>B(31), Cin => wire30, Sum =>Sum(31),Cout => Co);










END description; 
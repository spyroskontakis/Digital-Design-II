library ieee;
use ieee.std_logic_1164.all;

entity FA is
    port(A, B, C    :   in std_logic;
         Sum, Carry :   out std_logic);
end FA;

architecture FA_behav of FA is
begin
    Sum <= C xor (A xor B);
    Carry <= (C and (A xor B)) or (A and B) ;
end FA_behav;

--4 bit Adder
entity FOURBITADD is
    port(A, B : in std_logic_vector(3 downto 0);
         Cin  : in std_logic;
         Sum  : out std_logic_vector(3 downto 0);
         Cout, V    :   std_logic);
end FOURBITADD;

architecture FOURBITADDER_struct of FOURBITADDER is
    signal C    :   std_logic_vector (4 downto 0);
    component FA is
        port(A, B, C    :   in std_logic;
         Sum, Carry :   out std_logic);
    end component;
begin
    FA0 : FA
        port map(A(0), B(0), Cin,  Sum(0), C(1));
    FA1 : FA
        port map(A(1), B(1), C(0), Sum(1), C(2));
    FA2 : FA
        port map(A(2), B(2), C(1), Sum(2), C(3));
    FA3 : FA
        port map(A(3), B(3), C(2), Sum(3), C(4));
    V <= C(3) or C(4);
end FOURBITADDER_struct;
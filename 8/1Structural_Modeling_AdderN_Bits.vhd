--Structural Modeling Adder n bits
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(x,y    :   in std_logic;
        sum,carry:   out std_logic);
end half_adder;
architecture behave of half_adder is
begin
    sum <= x xor y;
    carry <= x and y;
end architecture behave;

entity full_adder is
    port(x,y,z    :   in std_logic;
        sum,carry:   out std_logic);
end full_adder;
architecture behave of full_adder is
begin
    sum <= z xor (x xor y);
    carry <= (z and(x xor y)) or (x and y);
end architecture behave;

entity AdderN_bits is
    generic(size : integer);
    port(A,B    :   in std_logic_vector(size -1 downto 0);
        S      :   out std_logic_vector(size -1 downto 0);
        Cout   :   out std_logic);
end entity AdderN_bits;

architecture struct of AdderN_bits is
    signal C    :   std_logic_vector(size -1 downto 0);
    component half_adder is 
        port(x,y    :   in std_logic;
            sum,carry:   out std_logic);
    end component half_adder;
    component full_adder is
        port(x,y,z    :   in std_logic;
            sum,carry:   out std_logic);
    end component full_adder;
begin
    g0: for i in 0 to size -1 generate
        g1: if i = 0 then
            u0: half_adder
            port map(A(0),B(0),S(0),C(0));
        end generate g1;
        g2: if i>0 then
            u1: full_adder
            port map(A(i),B(i),C(i-1),S(i),C(i));
        end generate g2;
    end generate g0;
    Cout <= C(size -1);
end architecture struct;
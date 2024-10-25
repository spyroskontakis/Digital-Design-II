library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(A, B, Cin     :    in std_logic;
         S, Cout       :    out std_logic);
end full_adder;

architecture BEHAV_FA of full_adder is
    signal int1, int2, int3 : std_logic;
begin

    --Process P1 that defines first HA
    P1: process(A, B)
    begin
        int1 <= A xor B;
        int2 <= A and B;
    end process P1;
    
    --Process P2 that defines second HA
    P2: process(int1, int2, Cin)
    begin
        S <= int1 xor Cin;
        int3 <= int1 and Cin;
        Cout <= int3 or int2;
    end process P2;

end architecture BEHAV_FA;
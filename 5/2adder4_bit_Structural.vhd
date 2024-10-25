entity HA is
    port(x, y  :   in bit;
         S, C  :   out bit);
end HA;

architecture behave of HA is
begin
    p0 : process(x,y)
    begin
        S <= x xor y;
        C <= x and y;
    end process p0;
end architecture behave;

entity FA is
    port(x, y, z  :   in bit;
         S, C  :   out bit);
end FA;

architecture behave of FA is
begin
    p0 : process(x,y,z)
    begin
        S <= x xor y xor z;
        C <= z and (x xor y) or (x and y);
    end process p0;
end architecture behave;


entity adder4_bit is
    port(A, B   :   in bit_vector(3 downto 0);
         S, C   :   out bit_vector(3 downto 0));
end adder4_bit;

architecture struct of adder4_bit is
begin
    bit0 : entity work.HA(behave)
        port map (A(0),B(0),S(0),C(0));
    bit1 : entity work.FA(behave)
        port map (A(1),B(1),C(0),S(1),C(1));
    bit2 : entity work.FA(behave)
        port map (A(2),B(2),C(1),S(2),C(2));
    bit3 : entity work.FA(behave)
        port map (A(3),B(3),C(2),S(3),C(3));
end architecture struct;
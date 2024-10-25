entity Adder8_bits is
    port(A, B, C    :   in std_logic;
         Sum, Cout  :   out std_logic);
end Adder8_bits;

architecture Adder8_bits_Conc of Adder8_bits is
    signal INS  :   std_logic_vector(2 downto 0);
begin
    INS <= A & B & C;
    (Cout, Sum) <= (0,0) when INS = "000" else
                   (0,1) when INS = "001" else
                   (0,1) when INS = "010" else
                   (1,0) when INS = "011" else
                   (0,1) when INS = "100" else
                   (1,0) when INS = "101" else
                   (1,0) when INS = "110" else
                   (1,1);
end architecture Adder8_bits_Conc;

architecture Adder8_bits_Conc2 of Adder8_bits is
    signal INS  :   std_logic_vector(2 downto 0);
begin
    INS(0) <= A;
    INS(1) <= B;
    INS(2) <= C;
    with INS select
        (Cout, Sum) <= std_logic_vector(0,0) when "000";
        (Cout, Sum) <= std_logic_vector(0,1) when "001";
        (Cout, Sum) <= std_logic_vector(0,1) when "010";
        (Cout, Sum) <= std_logic_vector(1,0) when "011";
        (Cout, Sum) <= std_logic_vector(0,1) when "100";
        (Cout, Sum) <= std_logic_vector(1,0) when "101";
        (Cout, Sum) <= std_logic_vector(1,0) when "110";
        (Cout, Sum) <= std_logic_vector(1,1) when "111";
end architecture Adder8_bits_Conc2;

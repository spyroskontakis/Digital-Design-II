--HA
entity half_adder is
    port(a,b  :   in std_logic;
        Sum,Carry  :   out std_logic);
end half_adder;
architecture behave of half_adder is
begin
    Sum   <= a xor b;
    Carry <= a and b;
end architecture behave;

--FA
entity full_adder is
    port(a,b,c  :   in std_logic;
        Sum,Carry  :   out std_logic);
end full_adder;
architecture behave of full_adder is
begin
    Sum   <= (a xor b )xor c;
    Carry <= (c and (a xor b)) or (a and b);
end architecture behave;

--32 bit Adder
entity thirty_two_bit_adder is
    port(A,B     :   in std_logic_vector(31 downto 0);
        S        :   out std_logic_vector(31 downto 0);
        Cout     :   out std_logic);
end thirty_two_bit_adder;

architecture struct of thirty_two_bit_adder is
    signal C            :   std_logic_vector(31 downto 0);
    component half_adder is
        port(a,b  :   in std_logic;
            Sum,Carry  :   out std_logic);
    end component;
    component full_adder is
        port(a,b,c  :   in std_logic;
            Sum,Carry  :   out std_logic);
    end component;
begin
    --HA
    u0: half_adder 
        port map(A(0),B(0),S(0),C(0));
    --31 FAs
    g1: for i in 1 to 31 generate
        u1: full_adder
            port map(A(i),B(i),C(i-1),S(i),C(i));
    end generate;
    
    --Assigning the final carry to Cout
    Cout <= C(31);
end struct;
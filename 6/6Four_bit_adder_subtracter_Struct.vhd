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

--4 bit Adder Subtractor
entity four_bit_adder_subtracter is
    port(A,B    :   in std_logic_vector(3 downto 0);
        switcher : in std_logic;
        S        :   out std_logic_vector(3 downto 0);
        Cout     :   out std_logic);
end four_bit_adder_subtracter;

architecture struct of four_bit_adder_subtracter is
    signal C            :   std_logic_vector(3 downto 0);
    signal switchedB    :   std_logic_vector(3 downto 0);    
    component half_adder is
        port(a,b  :   in std_logic;
            Sum,Carry  :   out std_logic);
    end component;
    component full_adder is
        port(a,b,c  :   in std_logic;
            Sum,Carry  :   out std_logic);
    end component;
begin
    g0: for i in 0 to 3 generate
        switchedB(i) <= B(i) xor switcher;
    end generate;

    --HA
    u0: half_adder 
        port map(A(0),switchedB(0),S(0),C(0));
    --3FAs
    g1: for i in 1 to 3 generate
        u1: full_adder
            port map(A(i),switchedB(i),C(i-1),S(i),C(i));
    end generate;
    
    --Assigning the final carry to Cout
    Cout <= C(3);
end struct;
entity full_adder is
    port (A, B, C : in std_logic;
          Sum,Carry : out std_logic);
end full_adder;

architecture full_adder_behav of full_adder is
begin
    Sum <= A xor B xor C;
    Carry <= (C and (A xor B)) or (A and B);
end full_adder_behav;


entity FOURBITADD is
    port(A,B    :   in std_logic_vector(3 downto 0);
         Cin    :   in std_logic;
         Sum    :   out std_logic_vector(3 downto 0);
         Cout   :   out std_logic);
end FOURBITADD;

architecture FOURBITADD_struct of FOURBITADD is
    signal c : std_logic_vector(3 downto 0);   
    component full_adder 
        port (A, B, Cin : in std_logic; --Same port with entity
              Sum,Carry : out std_logic);
    end component;
begin
    g0: for i in 0 to 3 generate 
        g1: if i=0 generate 
            u0: full_adder port map (A(i),B(i),Cin,Sum(i),c(i+1));
        end generate;

        g2: if i>0 and i<3 generate 
            u1: full_adder port map(A(i),B(i),c(i),sum(i),c(i+1));
        end generate;

        g3: if i=3 generate
            u2: full_adder port map(A(i),B(i),c(i),Sum(i),Cout);
        end generate;
    end generate;
end architecture FOURBITADD_struct;

architecture FOURBITADD_struct2 of FOURBITADD is
    signal c: std_logic_vector(4 downto 0);
    component full_adder 
        port (A, B, Cin : in std_logic;
              Sum,Carry : out std_logic);
    end component;
begin
    c(0) <= Cin;
    g0: for i in 0 to 3 generate 
        u0: full_adder port map (a => A(i), b => B(i), c => c(i), sum => Sum(i), carry => c(i+1));
    end generate;
    Cout <= c(4);
end architecture FOURBITADD_struct2;
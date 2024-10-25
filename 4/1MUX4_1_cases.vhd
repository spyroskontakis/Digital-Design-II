entity MUX4_1 is
    port(SEL    :   in std_logic_vector(2 downto 1);
         A, B, C, D    :    in std_logic;
         Z             :    out std);
end MUX4_1;

architecture behav_MUX41 of MUX4_1 is
begin
    PR_MUX : process(A,B,C,D)
    begin
        case SEL is
            when "00" => Z <= A;
            when "01" => Z <= B;
            when "10" => Z <= C;
            when "11" => Z <= D;
            when others Z <= 'X';
        end case;
    end process;
end behav_MUX41;
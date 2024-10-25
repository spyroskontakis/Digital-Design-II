entity MUX8_1 is
    port(S      :       in std_logic_vector(2 downto 0);
         A, B, C, D, E, F, G, H     :       in std_logic;
         F      :       out std_logic);
end MUX8_1;

architecture behave_MUX8_1 of MUX8_1 is
begin
    p0 : process(S, A, B, C, D, E, F, G, H)
    begin
        if(S = "000") then
            F <= A;
            elsif(S = "001") then
                F <= B;
            elsif(S = "010") then
                F <= C;
            elsif(S = "011") then
                F <= D;
            elsif(S = "100") then
                F <= E;
            elsif(S = "101") then
                F <= F;
            elsif(S = "110") then
                F <= G;
            else
                F <= H;
        end if;
    end p0;
end behave_MUX8_1;
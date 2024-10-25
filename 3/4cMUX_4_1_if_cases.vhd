entity MUX_4_1 is
    port(S              :    in std_logic_vector(1 downto 0);
         A, B, C, D     :    in std_logic;
         Z              :    out std_logic);
end entity MUX_4_1;

architecture behav_MUX_1c is    
begin
    P1: process (S, A, B, C, D)
    begin
        if S = "00"  then
                Z <= A;
            elsif S = "01" then
                Z <= B;
            elsif S = "10" then
                Z <= C;
            else
                Z <= D;
        end if;
    end process P1;
end behav_MUX_1a;
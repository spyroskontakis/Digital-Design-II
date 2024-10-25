entity DFF is
    port(D, CLK    :    in std_logic;
         Q         :    out std_logic);
end DFF;

architecture behave of DFF is
begin
    p0 : process
    begin
        wait until CLK'event and CLK = '0';
        Q <= D;
    end process p0;
end behave;
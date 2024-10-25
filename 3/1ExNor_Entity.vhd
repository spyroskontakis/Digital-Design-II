entity ExNor is
    port(a, b   :   in bit;
         F      :   out bit);
end entity ExNor;

architecture behave of ExNor is
begin
    p0 : process(a, b)
    begin
        if (a=b) then F <= '1';
        elsif (a/=b) then F<='0';
        end if;
    end process p0;
end architecture behave;
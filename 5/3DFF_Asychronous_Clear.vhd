library ieee;
use iee.std_logic_1164.all;

entity DFF_Clear is
    port(D, CLK, CLEAR  :   in std_logic;
         Q              :   out std_logic);
end DFF_Clear;

architecture BEHAV_DFF of DFF_Clear is
begin
    DFF_PROCESS : process (CLK, CLEAR)
    begin
        if(CLEAR = '1') then
            Q <= '0';
        elsif CLK'event and CLK='1' then
            Q <= D;
        end if;
    end process DFF_PROCESS;
end BEHAV_DFF;
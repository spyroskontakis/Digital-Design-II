library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SCNT is
    port(CLK,RSTn,EN : in std_logic;
         CNTR        : out std_logic_vector(7 downto 0));
end SCNT;

architecture RTL of SCNT is
    signal FF : std_logic_vector(7 downto 0);
begin
    process(CLK,RSTn)
    begin
        if(RSTn = '0') then 
            FF <= (FF'range => '0');
        elsif(CLK'event and CLK = '1') then
            if(EN = '1') then
                FF <= FF + "00000001";
            end if;
        end if;
    end process;
    CNTR <= FF;
end RTL;    
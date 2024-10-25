library ieee;
use ieee.std_logic_1164.all;

entity shift_right is
    port(EN,RSTn,CLK,SI : in std_logic;
         SO             : out std_logic);
end shift_right;

architecture RTL of shift_right is
    signal FF : std_logic_vector(7 downto 0);
begin
    posedge : process(RSTn, CLK)    --EN is not important designing the process
    begin
        if (RSTn = '0') then 
            FF <= (FF'range => '0');
        elsif(CLK'event and CLK ='1') then
            if(EN = '1') then
                FF <= SI&FF(FF'length -1 downto 1);
            end if;
        end if;
    end process;
    SO <= FF(0);
end architecture RTL;
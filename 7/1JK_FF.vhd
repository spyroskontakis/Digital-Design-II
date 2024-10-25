library ieee;
use ieee.std_logic_1164;

entity JKFF is
    port(J,K,CLK,RSTn   :   in std_logic;
         Q,Qn           :   out std_logic);
end JKFF;

architecture RTL of JKFF is
    signal FF : std_logic;
begin
    process(CLK,RSTn)
        variable JK : std_logic_vector(1 downto 0);
    begin
        if(RSTn = '0') then
            FF <= '0';
            elsif(CLK'event and CLK = '1' AND RSTn = '1') then
                JK:= J&K;
                case JK is
                    when "01" => FF <= '0';
                    when "10" => FF <= '1';
                    when "11" => FF <= not FF;
                    when others => FF <= FF;
                end case;
        end if;
    end process;
    Q <= FF after 2ns; Qn <= not FF after 2ns;
end RTL;
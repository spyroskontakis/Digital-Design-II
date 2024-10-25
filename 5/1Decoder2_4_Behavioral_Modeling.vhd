library ieee;
use ieee.std_logic_1164.all;

entity decoder2_4 is
    port( INP   :   in std_logic_vector(1 downto 0);
          OUTP  :   out std_logic_vector(0 to 3));
end decoder2_4;

architecture behav of decoder2_4 is
begin
    p0 : process(INP)
    begin
        case INP when
            "00" => OUTP <= "1000";
            "01" => OUTP <= "0100";
            "10" => OUTP <= "0010";
            "11" => OUTP <= "0001";
            others => "XXXX"
        end case;
    end p0;
end behav;
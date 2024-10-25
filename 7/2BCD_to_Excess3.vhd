library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_excess3 is
    generic(delay : time);
    port(bcd : in std_logic_vector(3 downto 0);
         exc : out std_logic_vector(3 downto 0));
end entity bcd_to_excess3;

architecture behave of bcd_to_excess3 is
begin
    convert:process(bcd)
    begin
        case input is
            when "0000" => exc <= "0011" after delay;
            when "0001" => exc <= "0100" after delay;
            when "0010" => exc <= "0101" after delay;
            when "0011" => exc <= "0110" after delay;
            when "0100" => exc <= "0111" after delay;
            when "0101" => exc <= "1000" after delay;
            when "0110" => exc <= "1001" after delay;
            when "0111" => exc <= "1010" after delay;
            when "1000" => exc <= "1011" after delay;
            when "1001" => exc <= "1100" after delay;
            when others => exc <= "XXXX";   
        end case;
    end process convert;
end architecture behave;
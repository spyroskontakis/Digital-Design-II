library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
    generic(product_delay : time);
    port(a,b     :   in std_logic_vector(3 downto 0);
         product :   out std_logic_vector(7 downto 0));
end entity multiplier;

architecture behave of multiplier i
begin
    product <= std_logic_vector(unsigned(a) * unsigned(b)) after product_delay;
end;
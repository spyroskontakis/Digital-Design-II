library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    generic(size : integer := 8);
    port(X,Y    :   in std_logic_vector (size-1 downto 0);
         C_IN   :   in bit;
         SUM    :   out std_logic_vector (size-1 downto 0);
         C_OUT  :   out bit);
end full_adder;
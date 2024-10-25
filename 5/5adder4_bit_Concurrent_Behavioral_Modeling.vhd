library ieee;
use ieee.std_logic_1164.all;

entity adder4_bit is
    port (A     :       in std_logic_vector(3 downto 0);
          B     :       in std_logic_vector(3 downto 0);
          CIN   :       in std_Logic;
          SUM   :       out std_logic_vector(3 downto 0);
          COUT  :       out std_logic);
end adder4_bit;

architecture ADD4_concurnt of adder4_bit is

    --define internal SUM signal including the carry
    signal SUMINT : std_logic_vector(4 downto 0);

begin
    SUMINT <= ('0' & A) + ('0' & B) + ("0000" & CIN);
    COUT <= SUMINT(4);
    SUM <= SUMINT(3 downto 0);
end ADD4_concurnt;  
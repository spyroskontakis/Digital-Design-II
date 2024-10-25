--Behavioral Modeling Register 16 bits

library ieee;
use ieee.std_logic_1164.all;

entity register16 is
    port(D  :   in std_logic_vector(15 downto 0);
         SEL :  in std_logic_vector(1 downto 0);
         CLK,CLRn,SI    :   in std_logic;
         Q  :   out std_logic_vector(15 downto 0));
end entity register16;

architecture behave of register16 is
    signal F : std_logic_vector(15 downto 0);
begin
    p0 : process(CLK,CLRn)
    begin
        if(CLRn = '0') then 
                F <= (F'range => '0');                      --Clearance
            elsif(CLK'event and CLK = '1') then
                case SEL is
                    when "00" => F <= D;                    --Parallel load
                    when "01" => F <= SI & D(15 downto 1);  --Right Shift
                    when "10" => F <= D(14 downto 0) & SI;  --Left Shift
                    when "11" => F <= not D;                --Complement
                    when others => F <= F;                  --Default stage
                end case;
        end if;
    end process p0;
    Q <= F;
end architecture behave;
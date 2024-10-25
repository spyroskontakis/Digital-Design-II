library ieee;
use ieee.std_logic_1164.all;

entity state_machine is
    port(clk, reset, x : in std_logic;
         y :   out std_logic);
end state_machine;

architecture behave of state_machine is
    type states is (S0,S1,S2,S3,S4,S5);
    signal state : states := S0;
begin
    process(clk, reset)
    begin
        if reset = '1' then state <= S0;
            elsif (CLK'event and CLK = `1`) then
                case state is
                    S0 => if (x = `0`) then state <= S1 else state <= S0; end if;
                    S1 => if (x = `0`) then state <= S1 else state <= S2; end if;
                    S2 => if (x = `0`) then state <= S3 else state <= S0; end if;
                    S3 => if (x = `0`) then state <= S1 else state <= S4; end if;
                    S4 => if (x = `0`) then state <= S5 else state <= S0; end if;
                    S5 => if (x = `0`) then state <= S1 else state <= S4; end if;
                end case;
        end if;
    end process;
    y <= '1' when state = S5 else
         '0' when others;
end behave;
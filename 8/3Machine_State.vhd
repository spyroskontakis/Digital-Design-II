entity state_machine is
    port(Sin,CLK    :   in std_logic;
         set_F  :   out std_logic);
end entity state_machine;

architecture behave of state_machine is
    type states is (S0,S1,S2,S3,S4,S5);
    signal state : states := S0;
begin
    set_state : process(CLK)
    begin
        if(CLK'event and CLK = '1') then
            set_F <= '0';
            case state is
                S0 => if (Sin = 0) then state <= S0 else state <= S1; end if;
                S1 => if (Sin = 0) then state <= S2 else state <= S1; end if;
                S2 => if (Sin = 0) then state <= S0 else state <= S3; end if;
                S3 => if (Sin = 0) then state <= S4 else state <= S1; end if;
                S4 => if (Sin = 0) then state <= S0 else state <= S3; end if;
                S5 => if (Sin = 0) then state <= S4 else state <= S1; end if;
            end case;
        end if;
    end process set_state;
    set_F <= '1' when state <= S5 else
             '0' when others;
end architecture behave;
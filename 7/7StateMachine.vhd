entity seq_detector is
    generic(delay: time);
    port( clk, Rst, x : in std_logic;
          y           : out std_logic);
end seq_detector;

architecture FSM of seq_detector is
    type states is(S0,S1,S2,S3);
    signal state : states := S0;
begin
    set_state : process(clk, Rst)
    begin
        if Rst = '1' then state <= S0;
        elsif (clk'event and CLK = '1') then
            case state is
                S0 => if(x = '1') then state <= S1 else state <= S0; end if;
                S1 => if(x = '1') then state <= S2 else state <= S0; end if;
                S2 => if(x = '1') then state <= S3 else state <= S0; end if;
                S3 => if(x = '1') then state <= S1 else state <= S0; end if;
            end case;
        end if;
    end process set_state;
    y <= '1' when state = S3 else 
         '0' when others;   
end architecture FSM;
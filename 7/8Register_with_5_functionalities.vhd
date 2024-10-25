entity register16_bits is
    port( CLRn,SI,CLK   :   in std_logic;
          S             :   in std_logic(1 downto 0);           --Selector of MUXes4_1(S1,S0)
          D             :   in std_logic_vector(15 downto 0);
          Q             :   out std_logic_vector(15 downto 0));
end entity register16_bits;

architecture behave of register16_bits is
begin
    process(CLK,CLRn)
    begin
        if(CLRn = '0') then                                         --Asychronous Clear
            Q <= (Q'range => '0');
        else if(CLK'event and CLK = '1') then
            case S is
                when "00" => Q <= D;                                     --Parallel load
                when "01" => Q <= SI&D(D'length downto 1);               --Right Shift
                when "10" => Q <= D(D'length -1 downto 0)&SI;            --Left Shift
                when "11" => Q <= not D;
            end case;
        end if;
    end process;
end architecture behave;
--Example1 of a process using Variables
--variables changes their values INSTANT!
architecture VAR of EXAMPLE is
    signal TRIGGER, RESULT : integer := 0;              --signal TRIGGER, RESULT := 0
begin
    process
        variable variable1 : integer := 1;              --variable variable1 := 1
        variable variable2 : integer := 2;              --variable variable2 := 2
        variable variable3 : integer := 3;              --variable variable3 := 3
    begin
        wait on TRIGGER;
        variable1 := variable2;                         --variable1 := 2
        variable2 := variable1 + variable3;             --variable2 := variable1 + variable3 := 2 + 3 := 5
        variable3 := variable2;                         --variable3 := variable2 := 5
        RESULT <= variable1 + variable2 + variable3;    --RESULT <= 2 + 5 + 5 <= 12
    end process;
end VAR;


--Example2 of a process using Signals
--signals changes their values in next clock cycle!
architecture SIGN of EXAMPLE is
    signal TRIGGER, RESULT : integer := 0;              --signal TRIGGER, RESULT := 0
    signal signal1 : integer := 1;                      --signal signal1 := 1
    signal signal2 : integer := 2;                      --signal signal2 := 2
    signal signal3 : integer := 3;                      --signal signal3 := 3
begin
    process
    begin
        wait on TRIGGER;
        signal1 <= signal2;                             --signal1 <= 2
        signal2 <= signal1 + signal3;                   --signal2 <= signal1 + signal3 <= 1 + 3
        signal3 <= signal2;                             --signal3 <= signal2 <= 2
        RESULT <= signal1 + signal2 + signal3;          --RESULT <= 1 + 2 +3
    end process;
end SIGN;


--Example3 of a process using hybrid
architecture behave of seq_sig_assgn is
    signal f1: bit := '1' ;                             --signal f1 := 1
    signal x : bit := '0' ;                             --signal x  := 0
begin
    p0 : process (x,a)
        variable f2 : bit := '0';                       --variable f2 := 0
        variable f3, f4 : bit := '0';                   --variable f3,f4 := 0
    begin
        f3 := f2 or f1;                                 --variable f3 := 0 or 1 := 1 INSTANT
        f4 := f3 and f1;                                --variable f4 := 1 and 1 := 1 INSTANT
        x <= (f3 and f4) after 5 ns;                    --signal x := (1 and 1) := 1 after 5 ns
        a <= x after 5 ns;                              --signal a <= 0 after 5 ns
    end process p0;                                         -- 1 after 10 ns
end behave;
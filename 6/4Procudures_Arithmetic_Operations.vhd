architecture rtl of control_processor is
    type func_code is (add, substract);
    signal func         : func_code;
    signal op1,op2,dest : integer;
    signal Z_flag       : boolean;
begin
    alu : process is
        procedure do_arith_op is
            variable result : integer;
        begin
            case func is
                when add => result      := op1 + op2; --Initialiazation (:=)
                when abstract => result := op1 - op2;
            end case;                           --Assign (<=)
            dest   <= result after Tpd;         --Time propagation delay
            Z_flag <= (result = 0) after Tpd; 
        end proceduer do_arith_op;
    begin
        do_arith_op;
    end process alu;
end architecture rtl;
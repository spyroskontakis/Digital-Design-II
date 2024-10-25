entity d_latch is
    port (d, clk    :   in bit;
          q         :   out bit);
end entity d_latch;

architecture basic of d_latch is   
begin
    p0 : process is
        if clk = '1' then
            q <= d after 2 ns;
        end if;
        wait on d, clk;
    end process p0;  
end architecture basic;

entity and2 is
    port(a, b   :   in bit;
         y      :   out bit);
end entity and2;

architecture basic of and2 is
begin 
    p0 : process is
        y <= a and b after 2 ns;
    end process p0;
    wait on a, b;
end architecture basic;

entity register_4 is
    port(bit0,bit1,bit2,bit3,gate   :   in bit;
         q0,q1,q2,q3        :   out bit);
end entity register_4;

architecture struct of register_4 is
    signal int_clk  :    bit;
begin
    bit0: entity work.d_latch(basic) 
        port map(d0, int_clk, q0);
    bit1: entity work.d_latch(basic) 
        port map(d1, int_clk, q1);
    bit2: entity work.d_latch(basic) 
        port map(d2, int_clk, q2);
    bit3: entity work.d_latch(basic) 
        port map(d3, int_clk, q3);
    gate: entity work.and2(basic)
        port map(enable, clk, clk_int);
end architecture struct;
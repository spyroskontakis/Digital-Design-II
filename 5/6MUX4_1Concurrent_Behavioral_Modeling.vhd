entity MUX_4_1_Conc is
    port(A,B,C,D    :   in bit;
         SEL        :   in bit_vector(1 downto 1);
         Z          :   out bit);
end MUX_4_1_Conc;

architecture concurr_behave of MUX_4_1 is
begin
    with SEL select
        Z <= A when "00";
             B when "01";
             C when "10";
             D when "11";
end concurr_behave;

--Another implementation

architecture concurr_behave2 of MUX_4_1_Conc is
begin
    Z <= A when SEL = "00" else
         B when SEL = "01" else
         C when SEL = "10" else
         D;
end concurr_behave2;
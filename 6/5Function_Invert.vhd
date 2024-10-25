entity byte_inv is
    port(x : in bit_vector(7 downto 0) ; y : out bit_vector(7 downto 0));
end byte_inv;

architecture behave of byte_inv is
    function invert( input : bit_vector(7 downto 0) ) return bit_vector(7 downto 0) is
        variable x_out : bit_vector (7 downto 0);
    begin
        for i in 7 downto 0 loop
            x_out(7-i) := input(i);
        end loop;
        return x_out;
    end invert;
    begin
        y <= invert(x);
end;
case S is
    when "00" => Y <= A;
    when "01" => Y <= B;
    when "10" => Y <= C;
    when "11" => Y <= D;
    when others => Y < 'X';
end case;

with S select
    Y <= A when "00";
         B when "01";
         C when "10";
         D when "11";

Y <= A when S = "00" else
     B when S = "01" else
     C when S = "10" else
     D;
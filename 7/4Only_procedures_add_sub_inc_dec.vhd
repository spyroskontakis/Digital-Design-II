procedure add(x, y : in bit_vector(size -1 downto 0); 
              sum  : out bit_vector(size -1 downto 0), 
              c_out: out bit);
    variable s: bit_vector(size downto 0);
begin
    s := '0'&x + '0'&y;
    sum := s(size -1 downto 0);
    c_out := s(size);
end add;

procedure sub(x, y : in bit_vector(size -1 downto 0); 
              d    : out bit_vector(size -1 downto 0), 
              c_out : out bit);
    variable s: bit_vector(size downto 0);
begin
    s:= '0'&x + not ('0'&y) + ((size -1 downto 0) => '0') & '1';
    d:= s(size -1 downto 0);
    c_out := s(size);
end sub;

procedure inc(x : in bit_vector(size -1 downto 0)) return bit_vector is
    variable x1: bit_vector(size -1 downto 0);
begin
    x1:= x + ((size-2 downto 0) => '0')&'1';
    return x1;
end procedure inc;

procedure dec(x : in bit_vector(size -1 downto 0)) return bit_vector is
    variable x1: bit_vector(size -1 downto 0);
begin
    x1:= x + ((size-1 downto 0) => '1'); --x + 2s complement of 0. .01 
    return x1;
end procedure dec;
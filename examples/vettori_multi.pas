program vettori_multi;
const
	n = 10;
	p=10;
var
	m : array[1..n, 1..p] of integer;
	i,j: integer;
begin
	randomize;
	for i := 1 to p do begin
		for j := 1 to n do begin
			m[i,j] := random(100)+1;
			write(m[i,j]:4);
		end;
		writeln;
	end;
end.

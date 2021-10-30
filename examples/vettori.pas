program vettori;
var a,b: array [1..10] of integer;
	i: integer;
begin
	randomize;
	for i := 1 to 10 do begin
		a[i] := random(100);
		writeln('a[',i,'] = ',a[i]);
	end;
	b := a;
	for i := 1 to 10 do a[i] := 0;
	writeln;
	for i := 1 to 10 do
		writeln('a[', i,'] = ', a[i]);
	writeln;
	for i := 1 to 10 do
		writeln('b[', i,'] = ', b[i]);
end.

program if_else;
var a,b: integer;
c: char;
begin
	writeln('inserisci due numeri: ');
	readln(a, b);
	if (a < b) then
		writeln(a, ' < ', b)
	else if (a = b) then
		writeln(a, ' = ', b)
	else
		writeln(a, ' > ', b);

	if ('c' < 'd') then
		writeln('ok');
	c := 'c';
	if (false < true) then
		writeln('false < true');

	if (c < 'd') then
		writeln('c < d');
	if (c < 'prova') then
		writeln('c < prova');

	a := 10;
	if (a < 29.2) then
		writeln('10 < 29.2');

	if (ord('c') < 10) then
		writeln('boh');
end.

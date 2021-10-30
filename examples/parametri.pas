program parametri;
procedure foo(a,b: integer; var c: integer);
{a e b sono parametri valore mentre c è variabile}
begin
	a := a * a;	{modifica locale}
	writeln('local a = ', a);
	b := b * b;	{modifica locale}
	writeln('local b = ', b);
	c := a + b;	{modifica globale}
	writeln('local c = ', c);
end;
var a, b, c: integer;
begin
	a := 10;
	b := 5;
	c := 0;
	foo(a, b, c);
	writeln('global a = ', a);
	writeln('global b = ', b);
	writeln('global c = ', c);
	{
	dopo questa chiamata abbiamo:
	c = 125
	a = 10
	b = 5
	i valori di a e b sono invariati mentre quello di c è stato
	modificato
	}
end.

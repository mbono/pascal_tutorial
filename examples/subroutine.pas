program subroutine_test;

function somma(a, b: integer): integer;
begin
	somma := a + b;
end;

procedure stampa_somma(a, b: integer);
begin
	writeln(a, ' + ', b, ' = ', a + b);
end;

function sqr(a: integer): integer;
begin
	sqr := a * a;
end;

procedure foo(a,b: integer; var c: integer);
{a e b sono parametri valore mentre c è variabile}
begin
	a := a * a;	{modifica locale}
	b := b * b;	{modifica locale}
	c := a + b;	{modifica globale}
end;

var a, b, n: integer;
begin
	writeln('inserisci due numeri:');
	readln(a, b);
	n := somma(a, b);
	writeln(a, ' + ', b, ' = ', a + b);
	writeln(a, ' + ', b, ' = ', somma(a, b));
	stampa_somma(a, b);
	foo(a, b, n);
	writeln(a, ' ', b,' ', n);
end.

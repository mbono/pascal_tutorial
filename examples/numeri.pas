program numeri;
var a, b, c, d: integer;
	r: real;
begin
	a := 12;
	writeln('a = ', a);
	b := 23;
	writeln('b = ', b);
	c := -25;
	writeln('c = ', c);
	d := a + c; 		{d = 12 -25 = -13}
	writeln('d = ', d);
	d := b - c; 		{d = 23 - (-25) = 48}
	writeln('d = ', d);
	d := b div 2; 		{23 div 2 = 11 divisione intera}
	writeln('d = ', d);
	d := b mod 2; 		{1 è il resto di prima}
	writeln('d = ', d);
	r := b / 2; 		{r = 23 / 2 =11.5 divisione reale}
	writeln('r = ', r);
end.

program pointer_demo2;

type pint = ^integer;	{definisce un puntatore ad integer}

var
	num: integer;
	p1, p2: pint;	{dichiarazione dei puntatori}
	p3: ^integer;	{dichiarazione diretta senza ricorrere a type}

begin
	num := 20;
	writeln('num = ', num);
	p1 := @num;	{p1 contiene l'indirizzo di num}
	writeln('p1^ = ', p1^);	{p1^ ci consente di accedere all'indirizzo
				contenuto nel puntatore}
	p2 := p1; {ora sia p1 che p2 puntano a num}
	writeln('p2^ = ', p2^);

	p1^ := 30;	{modifichiamo num attraverso il suo puntatore}
	writeln('num = ', num);
end.

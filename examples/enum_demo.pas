program enum_demo;

type giorni = (lunedi, martedi, mercoledi, giovedi, venerdi, sabato, domenica);

var g1, g2: giorni;
	a: array [lunedi .. domenica] of integer;

begin
	g1 := lunedi;
	g2 := sabato;

	if (g1 < g2) then
		writeln('g1 < g2')
	else
		writeln('g1 >= g2');

	a[lunedi] := 10;
	a[martedi] := 20;
end.

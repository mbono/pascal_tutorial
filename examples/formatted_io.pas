program formatted_io;
var a1,a2,a3,a4,a5,a6: integer;
begin
	a1 := 10;
	a2 := 334;
	a3 := 2103;
	a4 := 0;
	a5 := 46;
	a6 := 555;
	{testo non formattato}
	writeln('tabella:');
	writeln(a1, ' ', a2, ' ', a3);
	writeln(a4, ' ', a5, ' ', a6);
	writeln;
	{testo formattato}
	writeln('tabella:');
	writeln(a1:6, a2:6, a3:6); {6 colonne per dato}
	writeln(a4:6, a5:6, a6:6);
end.

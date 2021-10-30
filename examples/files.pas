program files;
var
	f: file of integer;
	num: integer;
begin
	writeln('inserire una serire di numeri ');
	writeln('per fermarsi inserite 0 ');
	(*creazione ed apertura in scrittura del file*)
	assign(f, 'dati.dat');
	rewrite(f);
	(*inserimento dei dati*)
	writeln;
	write('inserisci numero : ');
	readln(num);
	while (num <> 0) do begin
		write(f, num);
		write('inserisci numero : ');
		readln(num);
	end;
	(*chiusura del file*)
	close(f);
	(*apertura in lettura e lettura dei dati*)
	reset(f);
	writeln;
	writeln('hai inserito ', filesize(f), ' numeri');
	writeln;
	writeln('lettura dei dati memorizzati :');
	while (not eof(f)) do begin
		read(f, num);
		writeln(num);
	end;
	close(f);
end.

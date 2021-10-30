program io;
var i: integer;
	r: real; c: char;
	s: string;
begin
	writeln; {stampa una riga vuota}
	write('inserisci un numero intero :');
	readln(i);
	writeln('hai inserito : ', i);
	writeln;
	write('inserisci un numero reale :');
	readln(r);
	writeln('hai inserito ', r);
	writeln('hai inserito : ', r:3:4);
	writeln;
	write('inserisci un carattere :');
	readln(c);
	writeln('hai inserito : ',c);
	writeln;
	write('inserisci una stringa :');
	readln(s);
	writeln('hai inserito : ',s);
	writeln;
	write('inserimento multiplo di intero e reale :');
	readln(i,r);
	writeln('hai inserito : ',i,' ',r);
end.

program simple_menu;
var scelta: integer;
begin
	writeln(' menu pricipale : ');
	writeln;
	writeln('1. opzione a');
	writeln('2. opzione b');
	writeln('3. opzione c');
	writeln;
	write('Cosa scegli? (1..3): ');
	readln(scelta);
	case (scelta) of
	1:
		writeln('hai scelto l''opzione a !!');
	2:
		writeln('hai scelto l''opzione b !!');
	3:
		writeln('hai scelto l''opzione c !!')
	else
		writeln ('errore : la scelta effettuata non è corretta !!!!');
	end;
end.

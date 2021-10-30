program record_demo;

type utente = record
	nome: string;
	cognome: string;
	uid: integer;
end;

var mario, luca: utente;
	{un record si può anche specificare direttamente senza bisogno di
	definire il tipo con type}
	gianni: record
		nome: string;
		cognome: string;
		uid: integer;
		case coniugato: boolean of
		true:(
			moglie: string;
			nfigli: integer;
			);
	end;

begin
	mario.nome := 'Mario';
	mario.cognome := 'Rossi';
	mario.uid := 001;

	{utilizzo di with}
	with luca do begin
		nome := 'Luca';
		cognome := 'Verdi';
		uid := 002;
	end;

	writeln('nome: ' + mario.nome);
	writeln('nome: ' + luca.nome);

	gianni.nome := 'Gianni';
	gianni.coniugato := true;
	gianni.moglie := 'Maria';
	gianni.nfigli := 3;

	writeln('nome: ' + gianni.nome);
	writeln(gianni.nome + ' e'' sposato con ' + gianni.moglie);

	luca := mario;	{assegnazione}
	writeln('nome: ' + luca.nome);
	writeln('cognome: ' + luca.cognome);
end.

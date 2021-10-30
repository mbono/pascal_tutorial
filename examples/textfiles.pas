program prova_text;
uses crt;
var
	t: text;
	c: char;
begin
	(*creazione e apertura in scrittura*)
	assign(t,'testo.txt');
	rewrite(t);
	(*fase di scrittura testo*)
	writeln('inserire un testo (premere esc per terminare)');
	writeln;
	c:= readkey;
	(* #27 e #13 corrispondono a esc ed invio*)
	while (c <> #27) do begin
		if ( c = #13) then begin
			writeln(t);
			writeln;
		end
		else begin
			write(t,c);
			write(c);
		end;
		c := readkey;
	end;
	close(t);
	(*apertura in lettura*)
	reset(t);
	(*lettura del testo*)
	writeln;
	writeln('il testo inserito è il seguente :');
	writeln;
	while (not eof(t)) do begin
		if (eoln(t)) then begin
			readln(t);
			writeln;
		end
		else begin
			read(t,c);
			write(c);
		end;
	end;
	close(t);
end.

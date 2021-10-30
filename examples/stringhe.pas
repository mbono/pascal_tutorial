program stringhe;
var s1,s2,s3: string;
begin
	s1 := 'rossi';
	s2 := ''; {stringa vuota}
	s3 := 'carlo';
	s2 := s3 + ' ' + s1; {s2='carlo rossi'}
	writeln(s2);
end.

program pointer_demo;

type
	list = ^cell;
	cell = record
		value: integer;
		next: list;
	end;

var
	l1, l2: list;
begin
	new(l1);
	l1^.value := 10;
	l1^.next := NIL;
	writeln('l1^.value = ', l1^.value);

	new(l2);
	l2^.value := 20;
	l2^.next := NIL;

	l1^.next := l2;
	writeln('l1^.next^.value = ', l1^.next^.value);

	dispose(l1);
	dispose(l2);
end.

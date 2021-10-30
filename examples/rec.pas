program rec;

type point = record
	x, y: real;

	case is3D: boolean of
	true: ( z: real;);
	false: (w: real;);
end;
var a,b: point;
c: record
	nome: string;
	cognome: string;
	case coniugato: boolean of
	true:(
		moglie: string;
		nfigli: integer;
	);
end;
begin
	a.x := 10;
	a.y := 20;
	a.is3D := false;
	a.z := 30;
	a.w := 40;
	writeln(a.x:0:2);
	writeln(a.y:0:2);
	writeln(a.z:0:2);

end.

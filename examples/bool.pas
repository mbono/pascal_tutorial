program bool;
var a,b,c: boolean;
begin
	a := (12 < 15); 	{T}
	a := true;		{T}
	a := false;		{F}
	b := (12 < 10);		{F}
	c := a and b;		{T and F = F}
	c := a or b;		{T or F = T}
	c := not(a and b);	{a and b = F; not(false) = T}
	c := ('a' < 'b');	{T}
	c := ('hello' < 'world'); {T}
	c := ('h' < 'world');
end.

program setdemo;
type insiemeinteri = set of 0..255;
var a, b, c: insiemeinteri;
begin
  a := [1,2,3,4];
  b := [1,3];
  c := a - b;
  writeln('difference = [2,4]: ', c = [2,4]);
  writeln('2 in difference: ', 2 in c);
  writeln('3 in difference: ', 3 in c);
  writeln('union = a: ', a + b = a);
  writeln('intersection = b: ', a * b = b);
  writeln('b is a subset of a: ', b <= a);
end.

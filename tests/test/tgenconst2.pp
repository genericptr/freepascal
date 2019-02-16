{$mode objfpc}
program tgenconst2;

type
	generic TStuff1<T1,T2;const U1,U2> = record end;
	generic TStuff2<T1,T2;const U1,U2:integer> = record end;
	
var
	a: specialize TStuff1<integer,string,10,'string'>;
	b: specialize TStuff2<integer,string,10,10>;
begin
end.

{%FAIL}

{$mode objfpc}

program tgenconst11;

type
	generic TConst<const U:integer> = class end;

var
	thing: specialize TConst<10>;
begin
	thing:=specialize TConst<100>.Create;
end.

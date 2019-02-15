{%FAIL}

{$mode objfpc}

program tgenconst10;

type
	generic TByte<T> = record end;
	
var
	a: specialize TByte<10>;
begin
end.

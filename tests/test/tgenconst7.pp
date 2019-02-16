{%FAIL}
{$mode objfpc}
program tgenconst7;

type
	generic TInteger<const U: integer> = record end;

var
	a: specialize TInteger<'string'>;
begin
end.

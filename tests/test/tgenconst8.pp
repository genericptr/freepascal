{%FAIL}

{$mode objfpc}

program tgenconst8;

type
	generic TByte<const U: Byte> = record end;
	
var
	a: specialize TByte<300>;
begin
end.

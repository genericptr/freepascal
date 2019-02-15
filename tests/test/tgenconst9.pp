{%FAIL}

{$mode objfpc}

program tgenconst9;

type
	generic TByte<const U: Byte> = record end;
	
var
	a: specialize TByte<string>;
begin
end.

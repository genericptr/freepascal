{%FAIL}
{$mode objfpc}
program tgenconst11;
type
	TEnum = (aaa,bbb,ccc,ddd);
type
	generic TConst<const U> = class end;

var
	a:specialize TConst<10>;
	b:specialize TConst<10.5>;
	c:specialize TConst<'string'>;
	d:specialize TConst<[1,2,3]>;
	e:specialize TConst<[aaa,bbb,ccc]>;
begin
	a:=specialize TConst<20>.Create;
	b:=specialize TConst<10.1>.Create;
	c:=specialize TConst<'_string'>.Create;
	d:=specialize TConst<[1,2,3,4]>.Create;
	e:=specialize TConst<[aaa,bbb,ccc,ddd]>.Create;
end.
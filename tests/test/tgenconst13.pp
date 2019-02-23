{$mode objfpc}
program tgenconst13;
type
	TEnum = (aaa,bbb,ccc);
type
	generic TConst<const U> = class end;

var
	a:specialize TConst<10>;
	b:specialize TConst<10.5>;
	c:specialize TConst<'string'>;
	d:specialize TConst<[1,2,3]>;
	e:specialize TConst<[aaa,bbb,ccc]>;
begin
	a:=specialize TConst<10>.Create;
	b:=specialize TConst<10.5>.Create;
	c:=specialize TConst<'string'>.Create;
	d:=specialize TConst<[1,2,3]>.Create;
	e:=specialize TConst<[aaa,bbb,ccc]>.Create;
end.

{%PASS}

{$mode objfpc}

program tgenconst1;

type
	kNames = set of (Blaise,Pascal);
	kChars = set of char;
type
	generic TBoolean<const U: boolean> = record end;
	generic TString<const U: string> = record end;
	generic TFloat<const U: single> = record end;
	generic TInteger<const U: integer> = record end;
	generic TChar<const U: char> = record end;
	generic TByte<const U: byte> = record end;
	generic TQWord<const U: QWord> = record end;
	generic TUndefined<const U> = record end;
	generic TNames<const U: kNames> = record end;
	generic TChars<const U: kChars> = record end;
	generic TPointer<const U: pointer> = record end;

var
	a: specialize TBoolean<true>;
	b: specialize TString<'string'>;
	c: specialize TFloat<1>;
	d: specialize TInteger<10>;
	e: specialize TByte<255>;
	f: specialize TChar<'a'>;
	g: specialize TUndefined<nil>;
	h: specialize TNames<[Blaise,Pascal]>;
	i: specialize TChars<['a','b']>;
	j: specialize TQWord<10>;
	k: specialize TPointer<nil>;
begin
end.

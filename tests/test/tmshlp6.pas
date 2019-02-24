{%FAIL}
{$mode objfpc}
{$modeswitch multihelpers}

program tmshlp6;

type
	TMyObject = class
		m_num: integer;
		property num1: integer read m_num;
	end;
	THelper1 = class helper for TMyObject
		property num2: integer read m_num;
	end;
	THelper2 = class helper for TMyObject
		property num3: integer read m_num;
	end;

var
	obj: TMyObject;
	num: integer;
begin
	obj := TMyObject.Create;
	obj.m_num := 1;
	num := obj.num1 + obj.num2 + obj.num3;
end.

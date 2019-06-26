{%FAIL}
{$mode objfpc}

program tarrpropol5;

type
  TValue = TObject;

function GetGlobalValueInt(index: integer): TValue;
begin
  result:=nil;
end;

function GetGlobalValueStr(index: string): TValue;
begin
  result:=nil;
end;

{ make sure global properties aren't affect by changes }
property Values[index: integer]: TValue read GetGlobalValueInt;
property Values[index: string]: TValue read GetGlobalValueStr;

begin
end.

{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol2;

type
  TValue = TObject;
  TList = record
    function GetValueWithInt(index: integer): TValue;
    function GetValueWithString(index: string): TValue;
    { all default properties must share the same name }
    property Values0[index: integer]: TValue read GetValueWithInt; default;
    property Values1[index: string]: TValue read GetValueWithString; default;
  end;

function TList.GetValueWithInt(index: integer): TValue;
begin
  result := nil;  
end;

function TList.GetValueWithString(index: string): TValue;
begin
  result := nil;  
end;

begin
end.

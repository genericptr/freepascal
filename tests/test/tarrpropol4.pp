{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol4;

type
  TValue = TObject;
  TList = record
    function GetValueWithInt(index: integer): TValue;
    function GetValueWithString(index: string): TValue;
    { parametered properties still can't have duplicate names
      to fix error make properties default }
    property Values[index: integer]: TValue read GetValueWithInt;  
    property Values[index: string]: TValue read GetValueWithString;
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

{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol8;

type
  TValue = TObject;
  TList = record
    function GetValue(index: integer): TValue;
    function GetValue(index: word): TValue;
    { parametered properties must have unique parameters }
    property Values[index: integer]: TValue read GetValue;
    property Values[index: word]: TValue read GetValue;
  end;

function TList.GetValue(index: integer): TValue;
begin
  result := nil;  
end;

function TList.GetValue(index: word): TValue;
begin
  result := nil;  
end;

begin
end.

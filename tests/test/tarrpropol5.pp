{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol5;

type
  TValue = TObject;
  TList = record
    function GetValue(index: integer): TValue;
    function GetValue(index: word): TValue;
    { default properties must have unique parameters }
    property Values[index: integer]: TValue read GetValue; default;
    property Values[index: word]: TValue read GetValue; default;
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

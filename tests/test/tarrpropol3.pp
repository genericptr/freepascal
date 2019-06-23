{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol3;

type
  TValue = TObject;
  TList = record
    function GetValueWithInt(index: integer): TValue;
    { default properties must have unique parameters }
    property Values[index: integer]: TValue read GetValueWithInt; default;
    property Values[index: integer]: TValue read GetValueWithInt; default;
  end;

function TList.GetValueWithInt(index: integer): TValue;
begin
  result := nil;  
end;

begin
end.

{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol6;

type
  TValue = TObject;
  TList = record
    function GetValueWithInt(index: integer): TValue;
    function GetValueWithWord(index: word): TValue;
    { default properties must have unique parameters }
    property Values[index: integer]: TValue read GetValueWithInt; default;
    property Values[index: word]: TValue read GetValueWithWord; default;
  end;

function TList.GetValueWithInt(index: integer): TValue;
begin
  result := nil;  
end;

function TList.GetValueWithWord(index: word): TValue;
begin
  result := nil;  
end;

begin
end.

{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol1;

type
  TValue = TObject;
  TList = record
    function GetValueWithInt(index: integer): TValue;
    function GetValueWithString(index: string): TValue;
    function GetValueWithPair(index: integer; key: string): TValue;
    property Values[index: integer]: TValue read GetValueWithInt; default;
    property Values[index: string]: TValue read GetValueWithString; default;
    property Values[index: integer; key: string]: TValue read GetValueWithPair; default;
  end;

function TList.GetValueWithInt(index: integer): TValue;
begin
  result := nil;  
end;

function TList.GetValueWithString(index: string): TValue;
begin
  result := nil;  
end;

function TList.GetValueWithPair(index: integer; key: string): TValue;
begin
  result := nil;  
end;

var
  c: TList;
  v: TValue;
begin
  v := c[1];
  v := c['key'];
  v := c[1,'key'];

  v := c.values[1];
  v := c.values['a'];
  v := c.values[1, 'a'];
end.

{$mode objfpc}

program tarrpropol7;

var
  LastProc: integer = 0;

type
  TValue = TObject;
  TBase = class
    function GetValue(index: integer): TValue;
    property Values[index: integer]: TValue read GetValue; default;
  end;
  
  function TBase.GetValue(index: integer): TValue;
  begin
    LastProc := 1;
    result := nil;  
  end;

type
  TList = class(TBase)
    function GetAnotherValue(index: integer): TValue;
    function GetAnotherValue(index: string): TValue;
    { you can declare another default property of a different name
      if it's in a child object }
    property MoreValues[index: integer]: TValue read GetAnotherValue; default;
    property MoreValues[index: string]: TValue read GetAnotherValue; default;
  end;

  function TList.GetAnotherValue(index: integer): TValue;
  begin
    LastProc := 2;
    result := nil;  
  end;

  function TList.GetAnotherValue(index: string): TValue;
  begin
    LastProc := 3;
    result := nil;  
  end;

procedure Test(const value: TValue; desired: integer);
begin
  if LastProc <> desired then
    begin
      writeln('FAILED');
      Halt(-1);
    end;
end;

var
  c: TList;
  v: TValue;
begin
  { normal defaults }
  Test(c[1], 2);
  Test(c['key'], 3);

  { named default access }
  Test(c.Values[1], 1);
  Test(c.MoreValues[1], 2);
  Test(c.MoreValues['key'], 3);
end.

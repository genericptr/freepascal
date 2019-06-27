{$mode objfpc}

program tarrpropol6;

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
    function GetValue(index: integer): TValue;
    property Values[index: integer]: TValue read GetValue; default;
  end;

function TList.GetValue(index: integer): TValue;
begin
  LastProc := 2;
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
  { last wins }
  Test(c[1], 2);
  { cast to get child access }
  Test(TBase(c)[1], 1);
end.

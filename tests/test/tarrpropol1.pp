{$mode objfpc}
{$modeswitch advancedrecords}

program tarrpropol1;

var
  LastProc: integer = 0;

type
  TValue = TObject;
  TList = record
    function GetValue(index: integer): TValue; overload;
    function GetValue(index: string): TValue; overload;
    function GetValue(index: integer; key: string): TValue; overload;
    procedure SetValue(index: integer; value: TValue); overload;
    procedure SetValue(index: string; value: TValue); overload;
    procedure SetValue(index: integer; key: string; value: TValue); overload;
    { default properties }
    property Values[index: integer]: TValue read GetValue write SetValue; default;
    property Values[index: string]: TValue read GetValue write SetValue; default;
    property Values[index: integer; key: string]: TValue read GetValue write SetValue; default;
    { paramatered proprerties }
    property Values0[index: integer]: TValue read GetValue write SetValue;
    property Values0[index: string]: TValue read GetValue write SetValue;
    property Values0[index: integer; key: string]: TValue read GetValue write SetValue;
  end;

function TList.GetValue(index: integer): TValue;
begin
  LastProc := 1;
  result := nil;  
end;

function TList.GetValue(index: string): TValue;
begin
  LastProc := 2;
  result := nil;  
end;

function TList.GetValue(index: integer; key: string): TValue;
begin
  LastProc := 3;
  result := nil;  
end;

procedure TList.SetValue(index: integer; value: TValue);
begin
  LastProc := 4;
end;

procedure TList.SetValue(index: string; value: TValue);
begin
  LastProc := 5;
end;

procedure TList.SetValue(index: integer; key: string; value: TValue);
begin
  LastProc := 6;
end;

procedure Require(desired: integer);
begin
  if LastProc <> desired then
    begin
      writeln('FAILED');
      Halt(-1);
    end;
end;

procedure Test(const value: TValue; desired: integer);
begin
  Require(desired);
end;

var
  c: TList;
  v: TValue;
begin
  // setters (default)
  c[1] := v;                  Require(4);
  c['key'] := v;              Require(5);
  c[1,'key'] := v;            Require(6);

  // setters (named)
  c.values[1] := v;           Require(4);
  c.values['key'] := v;       Require(5);
  c.values[1,'key'] := v;     Require(6);

  // getters (default)
  Test(c[1], 1);
  Test(c['key'], 2);
  Test(c[1,'key'], 3);

  // getters (named)
  Test(c.values[1], 1);
  Test(c.values['a'], 2);
  Test(c.values[1, 'a'], 3);

  // getters (named, non-default)
  Test(c.values0[1], 1);
  Test(c.values0['a'], 2);
  Test(c.values0[1, 'a'], 3);
end.
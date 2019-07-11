{$mode objfpc}
{$modeswitch advancedrecords}

program tmoveop4;

type
  TBase = record
    num: integer;
    class operator Move(constref aSrc: TBase; var aDst: TBase);
  end;

type
  TChild = record
    base: TBase;
  end;

type
  TMyRecord = record
    field1: TChild;
    field2: TChild;
    constructor Create(num: integer);
  end;

var
  MoveCalls: integer = 0;

class operator TBase.Move(constref aSrc: TBase; var aDst: TBase);
begin
  MoveCalls += 1;
  aDst.num := aSrc.num;
end;

constructor TMyRecord.Create(num: integer);
begin
  field1.base.num := num;
  field2.base.num := num;
end;

const
  kValue = 10;
var
  a: TMyRecord;
begin
  a := TMyRecord.Create(kValue);
  { TMyRecord doesn't implement Move but the 2 nested record
    fields of type TBase do implement Move so we should get
    2 move calls. }
  if (MoveCalls <> 2) or (a.field1.base.num <> kValue) or (a.field2.base.num <> kValue) then
    begin
      writeln('Failed!');
      Halt(-1);
    end;
end.
{$mode objfpc}
{$modeswitch advancedrecords}

program tmoveop3;

type
  TBase = record
    class operator Move(constref aSrc: TBase; var aDst: TBase);
  end;

type
  TMyRecord = record
    field1: TBase;
    field2: TBase;
    constructor Create(num: integer);
  end;

var
  MoveCalls: integer = 0;

class operator TBase.Move(constref aSrc: TBase; var aDst: TBase);
begin
  MoveCalls += 1;
end;

constructor TMyRecord.Create(num: integer);
begin
end;

var
  a: TMyRecord;
begin
  a := TMyRecord.Create(0);
  { TMyRecord doesn't implement Move but the 2 nested record
    fields of type TBase do implement Move so we should get
    2 move calls. }
  if MoveCalls <> 2 then
    begin
      writeln('Failed!');
      Halt(-1);
    end;
end.
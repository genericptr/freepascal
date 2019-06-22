{$mode objfpc}
{$modeswitch advancedrecords}

program tmoveop2;

type
  TBase = record
    constructor Create(val: integer);
    class operator Copy(constref aSrc: TBase; var aDst: TBase);
  end;

var
  CopyCalled: boolean = false;

constructor TBase.Create(val: integer);
begin
end;

class operator TBase.Copy(constref aSrc: TBase; var aDst: TBase);
begin
  CopyCalled := true;
end;

var
  a: TBase;
begin
  // the move operator is not implemented so copy operator is used
  a := TBase.Create(1);
  if not CopyCalled then
    Halt(-1);
end.

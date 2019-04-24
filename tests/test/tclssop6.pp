{$mode objfpc}
{$modeswitch classoperators}

program tclssop6;

type
  TObject = object
    public type
      TValue = integer;
    public
      value: integer;
      class operator * (left: TObject; right: TValue): TObject;
  end;

class operator TObject.* (left: TObject; right: TValue): TObject;
begin
  result := left;
  result.value += right;
end;

type
  TMyObject = object (TObject)
    class operator + (left: TMyObject; right: TValue): TMyObject;
  end;

class operator TMyObject.+ (left: TMyObject; right: TValue): TMyObject;
begin
  result := left;
  result.value += right;
end;

var
  obj: TMyObject;
begin
  obj += 10;
  obj := TMyObject(obj * 4);
  writeln(obj.value);
end.

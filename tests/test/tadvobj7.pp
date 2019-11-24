{%FAIL}
{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj7;

{ advanced objects don't support management operators }
type
  TMyObject = object
    class operator AddRef(var Dest: TMyObject);
  end;

class operator TMyObject.AddRef(var Dest: TMyObject);
begin
end;

begin
end.

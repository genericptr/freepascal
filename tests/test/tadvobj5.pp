{%FAIL}
{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj5;

{ advanced objects don't support management operators }
type
  TMyObject = object
    class operator Finalize(var A: TMyObject);
  end;

class operator TMyObject.Finalize(var A: TMyObject);
begin
end;

begin
end.

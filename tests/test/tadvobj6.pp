{%FAIL}
{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj6;

{ advanced objects don't support management operators }
type
  TMyObject = object
    class operator Copy(constref Source: TMyObject; var Dest: TMyObject);
  end;

class operator TMyObject.Copy(constref Source: TMyObject; var Dest: TMyObject);
begin
end;

begin
end.

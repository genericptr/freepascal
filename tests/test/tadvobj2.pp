{%FAIL}
{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj2;

{ classes don't support operators }
type
  TMyClass = class
     class operator := (right: integer): TMyClass;
  end;

begin
end.
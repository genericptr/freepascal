{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}

program tadvobj8;

{ test to make sure advanced records don't enable advanced objects features }
type
  TMyObject = object
    class operator := (right: integer): TMyObject;
  end;

begin
end.
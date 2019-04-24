{%FAIL}
{$mode objfpc}
{$modeswitch classoperators}

program tclssop5;

// class operators are not allowed in helpers

type
  TMyClassHelper = class helper for TObject
    class operator + (left: TObject; right: integer): TObject;
  end;

begin
end.

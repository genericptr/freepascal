{%FAIL}
{$mode objfpc}
{$modeswitch advancedrecords}
program tgenconst18;

type
  generic TInt<const I: string> = record
    const c = I div I;
  end;

begin
end.
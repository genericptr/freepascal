{%FAIL}
{$mode delphi}
{$modeswitch classoperators}

program tclssop3;

// class operators are not supported in delphi mode
// because operator functions are also not supported

type
	TMyClass = class
		class operator implicit (right: integer): TMyClass;
	end;

begin
end.

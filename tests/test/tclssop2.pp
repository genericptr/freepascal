{%FAIL}
{$mode objfpc}
{$modeswitch classoperators}

program tclssop2;

// management operators are not supported in classes

type
	TMyClass = class
		public type
			TSelf = TMyClass;
		public
	    class operator Initialize(var A: TSelf);
	    class operator Finalize(var A: TSelf);
	    class operator Copy(constref Source: TSelf; var Dest: TSelf);
			class operator AddRef(var Dest: TSelf);
	end;

begin
end.

(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_5;

type
	THelperA = record
		procedure DoThis;
	end;

procedure THelperA.DoThis;
begin
	writeln('THelperA.DoThis');
end;

type
	generic TWrapper<T> = record
		objA: T;
		property helperA: T read objA; default;
	end;

var
	wrapper: specialize TWrapper<THelperA>;
begin
	wrapper.DoThis;
end.
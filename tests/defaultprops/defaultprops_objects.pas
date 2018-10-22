(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_8;

type
	THelperA = object
		num: integer;
		procedure DoThis;
	end;

procedure THelperA.DoThis;
begin
	writeln('THelperA.DoThis');
end;

type
	TWrapper = object
		objA: THelperA;
		property helperA: THelperA read objA write objA; default;
		//procedure DoThis;
	end;

//procedure TWrapper.DoThis;
//begin
//	writeln('TWrapper.DoThis -> void');
//end;

var
	wrapper: TWrapper;
begin
	wrapper.DoThis;
end.
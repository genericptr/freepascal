(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_1;

type
	THelperA = record
		procedure DoThis;
	end;

procedure THelperA.DoThis;
begin
	writeln('THelperA.DoThis');
end;
type
	TWrapper = record
		m_objA: THelperA;
		function GetHelper: THelperA;
		property helperA: THelperA read GetHelper; default;
	end;

function TWrapper.GetHelper: THelperA;
begin
	writeln('TWrapper.GetHelper');
	result := m_objA;
end;

var
	wrapper: TWrapper;
begin
	wrapper.DoThis;
end.
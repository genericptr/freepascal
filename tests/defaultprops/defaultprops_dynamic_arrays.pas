(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "x86_64"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_10;

type
	TIntArray = array of integer;
type
	TWrapper = record
		m_value: TIntArray;
		property value: TIntArray read m_value write m_value; default;
	end;

var
	wrapper: TWrapper;
	i: integer;
	a: array of integer;
begin
	// todo: compare_defs doesn't resolve for 2 arraydefs. this may been fixed in an update 
	wrapper.value := [100,200,300];
	wrapper[0] := 50;
	wrapper[1] += 1;
	for i in wrapper do
		writeln(i);
end.
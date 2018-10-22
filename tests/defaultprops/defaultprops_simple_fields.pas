(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_2;

type
	TWrapper = class
	private
		m_value: integer;
	public
		property value: integer read m_value write m_value; default;
	end;

var
	wrapper: TWrapper;
begin
	wrapper := TWrapper.Create;
	wrapper := 100;
	wrapper := wrapper + 1;
	wrapper += 1;
	writeln(wrapper.value);
end.
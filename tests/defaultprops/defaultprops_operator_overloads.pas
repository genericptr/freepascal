(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_7;

type
	TWrapper = record
		m_value: integer;
		property value: integer read m_value write m_value; default;
		//class operator := (right: integer): TWrapper;
		class operator + (left: TWrapper; right: integer): TWrapper;
		//class operator = (left: TWrapper; right: integer): boolean;
	end;

class operator TWrapper.+ (left: TWrapper; right: integer): TWrapper;
begin
	writeln('TWrapper.+');
	result := left;
	result.m_value := result.m_value + right;
end;

{
class operator TWrapper.:= (right: integer): TWrapper;
begin
	writeln('TWrapper.:=');
	// todo: we can't find := operators yet
	halt;
	//result.m_value := right;
end;

class operator TWrapper.= (left: TWrapper; right: integer): boolean;
begin
	writeln('TWrapper.=');
	result := left.m_value = right;
end;
}

var
	wrapper: TWrapper;
begin
	wrapper := 100;
	wrapper += 1;
	wrapper -= 2;
	writeln(wrapper.value);
end.
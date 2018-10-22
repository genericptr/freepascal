(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_3;

type
	TWrapper = record
		m_value: integer;
		function GetValue: integer;
		procedure SetValue (newValue: integer);
		property value: integer read GetValue write SetValue; default;
	end;

function TWrapper.GetValue: integer;
begin
	writeln('TWrapper.GetValue');
	result := m_value;
end;

procedure TWrapper.SetValue (newValue: integer);
begin
	writeln('TWrapper.SetValue');
	m_value := newValue;
end;

var
	wrapper: TWrapper;
	otherWrapper: TWrapper;
begin
	// note: gen_c_style_operator() throws an error on properties
	// so don't attempt these on default operators either
	//wrapper += 100;
	wrapper := 100;
	wrapper := wrapper + 100;
	//wrapper.SetValue(wrapper.GetValue + 1);
	//wrapper := otherWrapper; // wrapper.SetValue(otherWrapper); <<<--- WRONG TYPE, ignore property
	//wrapper := 100;
	writeln(wrapper.value);
end.
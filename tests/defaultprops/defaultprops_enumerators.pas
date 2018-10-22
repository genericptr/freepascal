(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)


{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_16;
uses
	fgl;

type
	generic TAuto<T> = record
	private
    m_object: T;
    property obj: T read m_object; default;
    class operator Initialize(var a: TAuto);
    class operator Finalize(var a: TAuto);
  end;

type
  TObjectAuto = specialize TAuto<TObject>;
  TStringList = specialize TFPGList<String>;
  TStringListAuto = specialize TAuto<TStringList>;

class operator TAuto.Initialize(var a: TAuto);
begin
	writeln('Initialize');
  a.m_object := T.Create;
end;

class operator TAuto.Finalize(var a: TAuto);
begin
	writeln('Finalize');
  a.m_object.Free;
end;

var
	list: TStringListAuto;
	str: string;
	i: integer;
begin
	list.Add('foo');
	list.Add('bar');
	for str in list do
		writeln(str);
	for i := 0 to list.count - 1 do
		writeln(list[i]);
end.
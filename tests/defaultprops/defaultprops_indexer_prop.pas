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
  TList = record
  	m_values: TIntArray;
    function GetItem(index: LongWord): integer;
    property Item[index: LongWord]: integer read GetItem; default;
    property values: TIntArray read m_values write m_values; default;
  end;

function TList.GetItem(index: LongWord): integer;
begin
	result := values[index];
end;

var
	list: TList;
	i: integer;
begin
	// todo: compare_defs doesn't resolve for 2 arraydefs. this may been fixed in an update 
	list.values := [100,200,300];
	writeln(list[1]);
	list[1] += 1;
	for i in list do
		writeln(i);
end.
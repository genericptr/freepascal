(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_15;

type
	THelper_Base = class
		num: integer;
		procedure DoThis (param: string);
	end;

procedure THelper_Base.DoThis (param: string);
begin
	writeln('THelper_Base.DoThis -> string');
end;

type
	THelper = class (THelper_Base)
		procedure DoThis; overload;
		procedure DoThis (param: integer); overload;
	end;

procedure THelper.DoThis;
begin
	writeln('THelper.DoThis:',num);
end;

procedure THelper.DoThis (param: integer);
begin
	writeln('THelper.DoThis -> integer');
end;

type
	TParent = class
		m_helper: THelper;
		function GetHelper: THelper;
		property helper: THelper read GetHelper; default;
		//property helper: THelper read m_helper; default;
		//procedure DoThis; overload;
		procedure DoThis (param: integer); overload;
	end;

function TParent.GetHelper: THelper;
begin
	result := m_helper;
end;

//procedure TParent.DoThis;
//begin
//	writeln('TParent.DoThis');
//end;

procedure TParent.DoThis (param: integer);
begin
	writeln('TParent.DoThis -> integer');
end;

type
	TMyObject = class (TParent)
		//num: integer;
		//m_helper: THelper;
		//property helper: THelper read m_helper;
		procedure Call;
		//procedure DoThis;
	end;

//procedure TMyObject.DoThis;
//begin
//	writeln('TMyObject.DoThis');
//end;

procedure TMyObject.Call;
begin
	DoThis('1');
end;

var
	obj: TMyObject;
begin
	obj := TMyObject.Create;
	obj.m_helper := THelper.Create;
	//obj.m_helper.num := 100;
	//obj.num := 100;
	//writeln(obj.num);
	//obj.DoThis('1');
	obj.Call;
end.
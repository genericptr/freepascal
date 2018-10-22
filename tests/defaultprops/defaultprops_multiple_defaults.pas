(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}

program default_property_test_4;

type
	THelperA = record
		procedure DoThis;
	end;

procedure THelperA.DoThis;
begin
	writeln('THelperA.DoThis');
end;

type
	THelperB = record
		procedure DoThat;
		//procedure DoThis;
	end;

procedure THelperB.DoThat;
begin
	writeln('THelperB.DoThat');
end;

//procedure THelperB.DoThis;
//begin
//	writeln('THelperB.DoThis');
//end;

type
	TWrapper_Base = class
		//procedure DoThis;
	end;

//procedure TWrapper_Base.DoThis;
//begin
//	writeln('TWrapper_Base.DoThis');
//end;

type
	TWrapper = class (TWrapper_Base)
		private
			m_objA: THelperA;
			m_objB: THelperB;
		public
			property helperA: THelperA read m_objA; default;
			property helperB: THelperB read m_objB; default;
			//procedure DoThis; reintroduce;
	end;

//procedure TWrapper.DoThis;
//begin
//	writeln('TWrapper.DoThis');
//end;

var
	wrapper: TWrapper;
begin
	wrapper := TWrapper.Create;
	wrapper.DoThis;
	wrapper.DoThat;
end.
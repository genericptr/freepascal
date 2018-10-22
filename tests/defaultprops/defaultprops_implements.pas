(*
	$build_compiler = true;
	$build_program = true;
	$run = true;
	$arch = "i386"; // x86_64 i386
	require("../build.php");
*)

{$mode objfpc}
{$modeswitch advancedrecords}
{$interfaces CORBA}

program default_property_test_11;

type
	IWrapper = interface ['IWrapper']
		procedure DoThis;
	end;

type
	TWrapper_Handler = class (IWrapper)
		procedure DoThis;
	end;

procedure TWrapper_Handler.DoThis;
begin
	writeln('TWrapper_Handler.DoThis');
end;

type
	TWrapper = class (IWrapper)
		m_wrapper: TWrapper_Handler;
		property handler: TWrapper_Handler read m_wrapper implements IWrapper; default;
		procedure AfterConstruction; override;
	end;

procedure TWrapper.AfterConstruction;
begin
	m_wrapper := TWrapper_Handler.Create;
end;

procedure HandleWrapper (wrapper: IWrapper);
begin
	wrapper.DoThis;
end;

var
	wrapper: TWrapper;
begin
	wrapper := TWrapper.Create;
	HandleWrapper(wrapper);
	wrapper.Dothis;
end.
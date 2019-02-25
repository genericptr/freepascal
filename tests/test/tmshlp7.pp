{$mode objfpc}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

unit tmshlp7;
interface

type
	TExtClassHelper = class helper for TObject
		procedure DoThisExt;
	end;
	TExtStringHelper = type helper for String
		function LengthExt: integer;
	end;

implementation
	
procedure TExtClassHelper.DoThisExt;
begin	
end;

function TExtStringHelper.LengthExt: integer;
begin
	result := System.Length(self);
end;

end.

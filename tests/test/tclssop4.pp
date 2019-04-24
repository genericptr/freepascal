{%FAIL}
{$mode objfpc}
{$modeswitch classoperators}
{$modeswitch advancedrecords}

program tclssop4;

// class operator enumerator is allowed like in records but
// not supported in implementation

type
  TArrayEnumerator = class
    public type
      TArrayValue = integer;
    public
      function GetCurrent: TArrayValue;
      constructor Create(a: pointer);
      property Current: TArrayValue read GetCurrent;
      function MoveNext: Boolean;
  end;
	TArray = class
  	class operator Enumerator(a: TArray): TArrayEnumerator;
	end;

class operator TArray.Enumerator(a: TArray): TArrayEnumerator;
begin
  result := TArrayEnumerator.Create(@a);
end;

function TArrayEnumerator.GetCurrent: TArrayValue;
begin
end;

constructor TArrayEnumerator.Create(a: pointer);
begin
end;

function TArrayEnumerator.MoveNext: Boolean;
begin  
end;

var
  arr: TArray;
  value: integer;
begin
  arr := TArray.Create;
  for value in arr do
    begin
    end;
end.

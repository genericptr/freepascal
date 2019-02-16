{$mode objfpc}
program tgenconst12;

type
  generic TTest<const U> = class
  		class procedure DoThis;
  end;

class procedure TTest.DoThis;
begin
end;

type
	ATest = specialize TTest<100>;
begin 
end.

{$mode objfpc}
{$modeswitch advancedrecords}
program tgenconst15;

type
	kNames = set of (Blaise, Pascal);
  generic TSet<const I: kNames> = record
    const c = I;
  end;
  generic TString<const I: String> = record
    const c = I;
  end;
  generic TWideString<const I: WideString> = record
    const c = I;
  end;
  generic TSingle<const I: Single> = record
    const c = I; 
  end;
  generic TDouble<const I: Double> = record
    const c = I; 
  end;
  generic TReal<const I: Real> = record
    const c = I; 
  end;

var
	a0: specialize TReal<100>;
begin
	writeln(a0.c);
end.
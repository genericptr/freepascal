{$mode objfpc}
{$modeswitch advancedrecords}
program tgenconst14;

type
  generic TBinaryOp<const I: Integer> = record
    const
    	d0 = I + I;
    	d1 = I - I; 
    	d2 = I * I; 
    	d3 = I / I; 
    	d4 = I div I; 
    	d5 = I mod I; 
    	d6 = I and I;
    	d7 = I or I;
  end;

var
	op: specialize TBinaryOp<100>;
begin
	writeln(op.d0);
	writeln(op.d1);
	writeln(op.d2);
	writeln(op.d3:1:1);
	writeln(op.d4);
	writeln(op.d5);
	writeln(op.d6);
	writeln(op.d7);
end.
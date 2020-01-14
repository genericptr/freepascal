{$mode objfpc}
{$modeswitch advancedrecords}
{
  test binary operators with generic constant params
}
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
      d8 = I shl I;
      d9 = I shr I;
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
  writeln(op.d8);
  writeln(op.d9);
end.
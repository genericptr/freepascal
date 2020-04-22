{$mode objfpc}

program tstaticarrayconstructor4;

var
  a: array[0..2,0..2] of integer;
  i, j: integer;
begin
 	a := [[1,2,3],[10,20,30],[100,200,300]];

  for i := 0 to 2 do
    for j := 0 to 2 do
      writeln(i,',',j,':',a[i,j]);
end.
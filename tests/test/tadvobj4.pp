{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj4;

type
  TVec2 = object
    x, y: integer;
    class operator + (left: TVec2; right: TVec2): TVec2;
  end;

class operator TVec2.+ (left: TVec2; right: TVec2): TVec2;
begin
  result.x := left.x + right.x;
  result.y := left.y + right.y;
end;

type
  TVec3 = object(TVec2)
    z: integer;
    class operator + (left: TVec3; right: TVec3): TVec3;
  end;

class operator TVec3.+ (left: TVec3; right: TVec3): TVec3;
begin
  result.x := left.x + right.x;
  result.y := left.y + right.y;
  result.z := left.z + right.z;
end;

var
  a0: TVec3 = (x: 1; y: 1; z: 1);
  b0: TVec3 = (x: 1; y: 1; z: 1);
  c0: TVec3;

  a1: TVec2 = (x: 1; y: 1);
  b1: TVec2 = (x: 1; y: 1);
  c1: TVec2;
begin
  c0 := a0 + b0;
  c1 := a1 + b1;
end.
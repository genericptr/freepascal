{$mode objfpc}
{$modeswitch advancedrecords}
program tgenconst17;

type
  generic TUnaryOp<const I: integer> = record
    const
      d0 = -I;
      d1 = +I;
      d2 = not I;
  end;
  generic TBinaryOp<const I: integer> = record
    const
      d0 = I + I;
      d1 = I - I;
      d2 = I * I; 
      d3 = I / I; 
      d4 = I div I; 
      d5 = I mod I; 
      d6 = I and I;
      d7 = I or I;
      d8 = I xor I;
      d9 = I shl I;
      d10 = I shr I;
      d11 = I << I;
      d12 = I >> I;
      d13 = I <> I;
      d14 = I < I;
      d15 = I > I;
      d16 = I <= I;
      d17 = I >= I;
      d18 = I = I;
  end;

begin
end.
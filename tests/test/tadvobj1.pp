{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj1;

type
  TMyObject = object
    public type
      TRight = integer;
      TSelf = TMyObject;
    public

      // Assignment operators
      class operator := (right: TRight): TSelf;
      class operator explicit (right: TRight): TSelf;

      // Arithmetic operators
      class operator + (left: TSelf; right: TRight): TSelf;
      class operator + (left: TSelf; right: TSelf): TSelf;
      class operator - (left: TSelf; right: TRight): TSelf;
      class operator * (left: TSelf; right: TRight): TSelf;
      class operator / (left: TSelf; right: TRight): TSelf;
      class operator ** (left: TSelf; right: TRight): TSelf;
      class operator div (left: TSelf; right: TRight): TSelf;
      class operator mod (left: TSelf; right: TRight): TSelf;

      // Logical operators
      class operator and (left: TSelf; right: TRight): TSelf;
      class operator or (left: TSelf; right: TRight): TSelf;
      class operator xor (left: TSelf; right: TRight): TSelf;
      class operator shl (left: TSelf; right: TRight): TSelf;
      class operator shr (left: TSelf; right: TRight): TSelf;
      //class operator << (left: TSelf; right: TRight): TSelf;
      //class operator >> (left: TSelf; right: TRight): TSelf;

      // Unary operators
      class operator + (left: TSelf): TSelf;
      class operator - (left: TSelf): TSelf;
      class operator not (left: TSelf): boolean;

      // Relational operators
      class operator <> (left: TSelf; right: TRight): boolean;
      class operator < (left: TSelf; right: TRight): boolean;
      class operator > (left: TSelf; right: TRight): boolean;
      class operator <= (left: TSelf; right: TRight): boolean;
      class operator >= (left: TSelf; right: TRight): boolean;
      class operator = (left: TSelf; right: TRight): boolean;

      // Set operators
      class operator >< (left: TSelf; right: TRight): boolean;
      class operator in (left: TSelf; right: TRight): boolean;
  end;

class operator TMyObject.:= (right: TRight): TSelf;
begin
  writeln('TMyObject.:=');
end;

class operator TMyObject.explicit (right: TRight): TSelf;
begin
  writeln('TMyObject.explicit');
end;  

class operator TMyObject.+ (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.+ (left: TSelf; right: TSelf): TSelf;
begin
  result := left;
end;

class operator TMyObject.- (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.* (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject./ (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.** (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.div (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.mod (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.and (left: TSelf; right: TRight): TSelf;
begin 
  result := left;
end;

class operator TMyObject.or (left: TSelf; right: TRight): TSelf;
begin 
  result := left;
end;

class operator TMyObject.xor (left: TSelf; right: TRight): TSelf;
begin 
  result := left;
end;

class operator TMyObject.shl (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

class operator TMyObject.shr (left: TSelf; right: TRight): TSelf;
begin
  result := left;
end;

//class operator TSelf.<< (left: TSelf; right: TRight): TSelf;
//begin
//end;

//class operator TSelf.>> (left: TSelf; right: TRight): TSelf;
//begin
//end;

class operator TMyObject.not (left: TSelf): boolean;
begin
end;

class operator TMyObject.+ (left: TSelf): TSelf;
begin
  result := left;
end;

class operator TMyObject.- (left: TSelf): TSelf;
begin
  result := left;
end;

class operator TMyObject.<> (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.< (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.> (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.<= (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.>= (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.= (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.>< (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyObject.in (left: TSelf; right: TRight): boolean;
begin
end;

var
  c: TMyObject;
  b: boolean;
begin
  // Assignment operators
  c := TMyObject(100);
  c := 100;

  // Arithmetic operators
  c := c + 1;
  c := c - 1;
  c := c * 1;
  c := c / 1;
  c += 1;
  c -= 1;
  c *= 1;
  c /= 1;
  c := c ** 1;
  c := c div 1;
  c := c mod 1;

  // Logical operators
  c := c and 1;
  c := c or 1;
  c := c xor 1;
  c := c shl 1;
  c := c shr 1;

  // Unary operators
  c := +c;
  c := -c;
  b := not c;

  // Relational operators
  b := c <> 1;
  b := c > 1;
  b := c > 1;
  b := c <= 1;
  b := c >= 1;
  b := c = 1;

  // Set operators
  b := c >< 1;
  b := c in 1;
end.
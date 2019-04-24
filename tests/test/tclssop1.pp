{$mode objfpc}
{$modeswitch classoperators}

program tclssop1;

type
	TMyClass = class
		public type
			TRight = integer;
			TSelf = TMyClass;
		public

			// Assignment operators
			class operator := (right: TRight): TSelf;
			class operator explicit (right: TRight): TSelf;

			// Arithmetic operators
			class operator + (left: TSelf; right: TRight): TSelf;
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

class operator TMyClass.:= (right: TRight): TSelf;
begin
	result := TMyClass.Create;
end;

class operator TMyClass.explicit (right: TRight): TSelf;
begin
	result := TMyClass.Create;
end;	

class operator TMyClass.+ (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.- (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.* (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass./ (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.** (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.div (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.mod (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.and (left: TSelf; right: TRight): TSelf;
begin	
end;

class operator TMyClass.or (left: TSelf; right: TRight): TSelf;
begin	
end;

class operator TMyClass.xor (left: TSelf; right: TRight): TSelf;
begin	
end;

class operator TMyClass.shl (left: TSelf; right: TRight): TSelf;
begin
end;

class operator TMyClass.shr (left: TSelf; right: TRight): TSelf;
begin
end;

//class operator TSelf.<< (left: TSelf; right: TRight): TSelf;
//begin
//end;

//class operator TSelf.>> (left: TSelf; right: TRight): TSelf;
//begin
//end;

class operator TMyClass.not (left: TSelf): boolean;
begin
end;

class operator TMyClass.+ (left: TSelf): TSelf;
begin
end;

class operator TMyClass.- (left: TSelf): TSelf;
begin
end;

class operator TMyClass.<> (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.< (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.> (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.<= (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.>= (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.= (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.>< (left: TSelf; right: TRight): boolean;
begin
end;

class operator TMyClass.in (left: TSelf; right: TRight): boolean;
begin
end;

var
	c: TMyClass;
begin
	c := TMyClass(100);
end.

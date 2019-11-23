{%FAIL}
{$mode objfpc}
{$modeswitch advancedobjects}

program tadvobj3;

{ advanced objects don't support management operators }
type
  TMyObject = object
    class operator Initialize(var A: TMyObject);
    class operator Finalize(var A: TMyObject);
    class operator Copy(constref Source: TMyObject; var Dest: TMyObject);
    class operator AddRef(var Dest: TMyObject);
  end;

class operator TMyObject.Initialize(var A: TMyObject);
begin
end;

class operator TMyObject.Finalize(var A: TMyObject);
begin
end;

class operator TMyObject.Copy(constref Source: TMyObject; var Dest: TMyObject);
begin
end;

class operator TMyObject.AddRef(var Dest: TMyObject);
begin
end;

begin
end.

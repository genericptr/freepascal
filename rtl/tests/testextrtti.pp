program testextrtti;

{$MODE OBJFPC}

uses typinfo, sysutils;

Type
  {$RTTI EXPLICIT PROPERTIES([vcPrivate,vcProtected,vcPublic,vcPublished])}

  { TFieldRTTI }

  TFieldRTTI = Class
  private
    FPrivateA: Integer;
    FPrivateB: Integer;
    FProtectedA: Integer;
    FProtectedB: Integer;
    FPublicA: Integer;
    FPublicB: Integer;
    FPublishedA: Integer;
    FPublishedB: Integer;
    Property PrivateA : Integer Read FPrivateA Write FPrivateA;
    Property PrivateB : Integer Read FPrivateB Write FPrivateB;
  Protected
    Property ProtectedA : Integer Read FProtectedA Write FProtectedA;
    Property ProtectedB : Integer Read FProtectedB Write FProtectedB;
  Public
    Property PublicA : Integer Read FPublicA Write FPublicA;
    Property PublicB : Integer Read FPublicA Write FPublicB;
  Published
    Property PublishedA : Integer Read FPublishedA Write FPublishedA;
    Property PublishedB : Integer Read FPublishedA Write FPublishedB;
  end;

Procedure AssertEquals(Msg : String; aExpected,aActual : Integer);

begin
  If AExpected<>aActual then
    begin
    Msg:=Msg+': expected: '+IntToStr(aExpected)+' got: '+IntToStr(aActual);
    Writeln(Msg);
    Halt(1);
    end;
end;

Procedure AssertEquals(Msg : String; aExpected,aActual : String);

begin
  If AExpected<>aActual then
    begin
    Msg:=Msg+': expected: <'+aExpected+'> got: <'+aActual+'>';
    Writeln(Msg);
    Halt(1);
    end;
end;

Procedure AssertEquals(Msg : String; aExpected,aActual : TVisibilityClass);

begin
  If AExpected<>aActual then
    begin
    Msg:=Msg+': expected: '+IntToStr(Ord(aExpected))+' got: '+IntToStr(Ord(aActual));
    Writeln(Msg);
    Halt(1);
    end;
end;

Procedure AssertEquals(Msg : String; aExpected,aActual : TTypeKind);

begin
  If AExpected<>aActual then
    begin
    Msg:=Msg+': expected: '+IntToStr(Ord(aExpected))+' got: '+IntToStr(Ord(aActual));
    Writeln(Msg);
    Halt(1);
    end;
end;


Procedure CheckProperty(aIdx : Integer; aData: TPropInfoEx; aName : String; aKind : TTypeKind; aVisibility : TVisibilityClass);

Var
  Msg : String;

begin
  Msg:='Checking prop '+IntToStr(aIdx)+' ('+aName+') ';
  AssertEquals(Msg+'name',aData.Info^.Name,aName);
  AssertEquals(Msg+'kind',aData.Info^.PropType^.Kind,aKind);
  AssertEquals(Msg+'visibility',TVisibilityClass(aData.Flags),aVisibility);
end;

Var
  A : PPropListEx;
  aCount : Integer;

begin
  aCount:=GetPropListEx(TFieldRTTI,A);
  try
    AssertEquals('Count',8,aCount);
    CheckProperty(0, A^[0]^,'PrivateA',tkInteger,vcPrivate);

  finally
    Freemem(A);
  end;



end.

